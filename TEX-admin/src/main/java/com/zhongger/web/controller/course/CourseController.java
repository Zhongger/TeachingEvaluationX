package com.zhongger.web.controller.course;

import com.zhongger.common.core.controller.BaseController;
import com.zhongger.common.core.domain.AjaxResult;
import com.zhongger.common.core.domain.entity.SysUser;
import com.zhongger.common.core.page.TableDataInfo;
import com.zhongger.common.course.domin.Course;
import com.zhongger.common.course.domin.CourseVO;
import com.zhongger.common.course.service.CourseService;
import com.zhongger.common.teacher.domain.TeacherVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by Zhong Mingyi on 2020/12/5.
 */
@RestController
@RequestMapping("/course")
public class CourseController extends BaseController {
    @Autowired
    private CourseService courseService;

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public AjaxResult add(@Validated @RequestBody Course course) {
        if (courseService.checkCourseIdUnique(course.getCourseId()) > 0) {
            return AjaxResult.error("新增课程'" + course.getCourseName() + "'失败，课程编号已存在");
        }
        return toAjax(courseService.insertCourse(course));
    }

    @GetMapping("/list")
    public TableDataInfo list(Course course){
        startPage();
        List<CourseVO> list = courseService.selectCourseList(course);
        return getDataTable(list);
    }
}
