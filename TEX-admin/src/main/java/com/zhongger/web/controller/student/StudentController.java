package com.zhongger.web.controller.student;

import com.zhongger.common.core.controller.BaseController;
import com.zhongger.common.core.domain.AjaxResult;
import com.zhongger.common.core.domain.entity.SysUser;
import com.zhongger.common.core.page.TableDataInfo;
import com.zhongger.common.course.domin.Course;
import com.zhongger.common.course.domin.CourseVO;
import com.zhongger.common.course.domin.SelectCourse;
import com.zhongger.common.course.domin.SelectCourseVO;
import com.zhongger.common.course.service.CourseService;
import com.zhongger.common.evaluation.service.EvaluationService;
import com.zhongger.common.student.domain.StudentVO;
import com.zhongger.common.student.service.StudentService;
import com.zhongger.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Created by Zhong Mingyi on 2020/12/4.
 */
@RestController
@RequestMapping("/student")
public class StudentController extends BaseController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private CourseService courseService;


    @GetMapping("/list")
    public TableDataInfo list(SysUser user) {
        startPage();
        List<StudentVO> list = studentService.selectStudentList(user.getUserName(), "student");
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('student:user:list')")
    @GetMapping("/listSelectCourse")
    public TableDataInfo listSelectCourse(Course course) {
        startPage();
        String username = SecurityUtils.getUsername();//学生用户名
        SelectCourse selectCourse = new SelectCourse();
        selectCourse.setUserName(username);
        List<CourseVO> list = courseService.selectCourseList(course);
        List<SelectCourseVO> selectCourseVOList = courseService.selectSelectCourseList(selectCourse);
        Map<String, List<SelectCourseVO>> map = null;
        if (selectCourseVOList.size() > 0) {
            map = selectCourseVOList.stream().collect(Collectors.groupingBy(SelectCourseVO::getCourseId));
        } else {
            list.stream().forEach(courseVO -> courseVO.setSelectStatus("未选"));
            return getDataTable(list);
        }

        for (CourseVO courseVO : list) {
            String courseId = courseVO.getCourseId();
            if (map == null) {
                courseVO.setSelectStatus("未选");
            } else {
                List<SelectCourseVO> selectCourseVOs = map.get(courseId);
                if (selectCourseVOs==null){
                    courseVO.setSelectStatus("未选");
                }else {
                    SelectCourseVO selectCourseVO = selectCourseVOs.get(0);
                    courseVO.setSelectStatus(selectCourseVO.getSelectStatus());
                }

            }
        }
        return getDataTable(list);
    }


    @PostMapping("/selectCourseList")
    public TableDataInfo selectCourseList(SelectCourse selectCourse) {
        startPage();
        String username = SecurityUtils.getUsername();//学生用户名
        selectCourse.setUserName(username);
        List<SelectCourseVO> list = courseService.selectSelectCourseList(selectCourse);
        return getDataTable(list);
    }

    @PostMapping("/addSelectCourse")
    public AjaxResult addSelectCourse(@RequestBody SelectCourse selectCourse){

        selectCourse.setUserName(SecurityUtils.getUsername());
        int count = courseService.selectStudentCourseTeacher(selectCourse);
        if (count>0){
            return toAjax(courseService.addStudentCourseTeacher(selectCourse));
        }
        return toAjax(courseService.insertStudentCourseTeacher(selectCourse));
    }

    @PostMapping("/deleteSelectCourse")
    public AjaxResult deleteSelectCourse(@RequestBody SelectCourse selectCourse){
        selectCourse.setUserName(SecurityUtils.getUsername());
        return toAjax(courseService.deleteSelectCourse(selectCourse));
    }

}
