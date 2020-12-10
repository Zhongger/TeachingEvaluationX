package com.zhongger.web.controller.teacher;

import com.zhongger.common.core.controller.BaseController;
import com.zhongger.common.core.domain.entity.SysUser;
import com.zhongger.common.core.page.TableDataInfo;
import com.zhongger.common.course.domin.CourseVO;
import com.zhongger.common.evaluation.domain.Evaluation;
import com.zhongger.common.evaluation.service.EvaluationService;
import com.zhongger.common.student.domain.StudentVO;
import com.zhongger.common.teacher.domain.PieVO;
import com.zhongger.common.teacher.domain.TeacherVO;
import com.zhongger.common.teacher.service.TeacherService;
import com.zhongger.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Created by Zhong Mingyi on 2020/12/4.
 */
@RestController
@RequestMapping("/teacher")
public class TeacherController extends BaseController {

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private EvaluationService evaluationService;

    @GetMapping("/list")
    public TableDataInfo list(SysUser user) {
        startPage();
        List<TeacherVO> list = teacherService.selectTeacherList(user.getUserName(), "teacher");
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('teacher:user:list')")
    @GetMapping("/listTeacherCourse")
    public TableDataInfo listTeacherCourse() {
        startPage();
        List<CourseVO> list = teacherService.listTeacherCourse(SecurityUtils.getUsername());
        return getDataTable(list);
    }

    @PostMapping("/listEvaluationStudent")
    public TableDataInfo listEvaluationStudent(String courseId) {
        startPage();
        List<StudentVO> list = teacherService.listEvaluationStudent(SecurityUtils.getUsername(), courseId);
        return getDataTable(list);
    }

    @PostMapping("/listEvaluationDetail")
    public TableDataInfo listEvaluationDetail(String courseId, String studentId) {
        startPage();
        List<Evaluation> list = teacherService.listEvaluationDetail(SecurityUtils.getUsername(), courseId, studentId);
        return getDataTable(list);

    }

    @GetMapping("/getEvaluationContentResultAnalysis")
    public List<PieVO> getEvaluationContentResultAnalysis() {
        List<Evaluation> list = evaluationService.selectAllEvaluationList();
        List<PieVO> resList = new ArrayList<>();
        for (Evaluation evaluation : list) {
            PieVO pieVO = new PieVO();
            pieVO.setName(evaluation.getContent().split("：")[0]);
            pieVO.setValue(evaluation.getScore());
            resList.add(pieVO);
        }
        return resList;
    }

    @GetMapping("/getEvaluationSummary")
    public List<Evaluation> getEvaluationSummary() {
        String username = SecurityUtils.getUsername();
        List<Evaluation> evaluations = evaluationService.selectAllEvaluationList();
        List<Integer> evaluationMetaIds = new ArrayList<>();
        evaluations.forEach(evaluation -> evaluationMetaIds.add(evaluation.getId()));
        //每项评价中，不同科目的总分
        List<Evaluation> evaluationCourseSumList = teacherService.listEvaluationCourseSumList(username, evaluationMetaIds);
        return evaluationCourseSumList;
    }

    //各项总分
    @GetMapping("/getEvaluationSumList")
    public List<Evaluation> getEvaluationSumList() {
        return teacherService.listEvaluationSum(SecurityUtils.getUsername());
    }

}
