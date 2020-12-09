package com.zhongger.web.controller.teacher;

import com.zhongger.common.core.controller.BaseController;
import com.zhongger.common.core.domain.entity.SysUser;
import com.zhongger.common.core.page.TableDataInfo;
import com.zhongger.common.course.domin.CourseVO;
import com.zhongger.common.student.domain.StudentVO;
import com.zhongger.common.teacher.domain.TeacherVO;
import com.zhongger.common.teacher.service.TeacherService;
import com.zhongger.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by Zhong Mingyi on 2020/12/4.
 */
@RestController
@RequestMapping("/teacher")
public class TeacherController extends BaseController {

    @Autowired
    private TeacherService teacherService;

    @GetMapping("/list")
    public TableDataInfo list(SysUser user){
        startPage();
        List<TeacherVO> list = teacherService.selectTeacherList(user.getUserName(),"teacher");
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('teacher:user:list')")
    @GetMapping("/listTeacherCourse")
    public TableDataInfo listTeacherCourse(){
        startPage();
        List<CourseVO> list = teacherService.listTeacherCourse(SecurityUtils.getUsername());
        return getDataTable(list);
    }

    @PostMapping("/listEvaluationStudent")
    public TableDataInfo listEvaluationStudent(String courseId){
        startPage();
        List<StudentVO> list = teacherService.listEvaluationStudent(SecurityUtils.getUsername(),courseId);
        return getDataTable(list);
    }

}
