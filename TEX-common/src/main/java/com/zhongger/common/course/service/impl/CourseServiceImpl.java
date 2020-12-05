package com.zhongger.common.course.service.impl;

import com.zhongger.common.course.domin.Course;
import com.zhongger.common.course.domin.CourseVO;
import com.zhongger.common.course.domin.SelectCourse;
import com.zhongger.common.course.domin.SelectCourseVO;
import com.zhongger.common.course.mapper.CourseMapper;
import com.zhongger.common.course.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Zhong Mingyi on 2020/12/5.
 */
@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseMapper courseMapper;

    @Override
    public int checkCourseIdUnique(String courseId) {
        return courseMapper.checkCourseIdUnique(courseId);
    }

    @Override
    public int insertCourse(Course course) {
        return courseMapper.insertCourse(course);
    }

    @Override
    public List<CourseVO> selectCourseList(Course course) {
        return courseMapper.selectCourseList(course);
    }

    @Override
    public List<SelectCourseVO> selectSelectCourseList(SelectCourse selectCourse) {
        return courseMapper.selectSelectCourseList(selectCourse);
    }

    @Override
    public int insertStudentCourseTeacher(SelectCourse selectCourse) {
        return courseMapper.insertStudentCourseTeacher(selectCourse);
    }

    @Override
    public int deleteSelectCourse(SelectCourse selectCourse) {
        return courseMapper.deleteSelectCourse(selectCourse);
    }

    @Override
    public int selectStudentCourseTeacher(SelectCourse selectCourse) {
        return courseMapper.selectStudentCourseTeacher(selectCourse);
    }

    @Override
    public int addStudentCourseTeacher(SelectCourse selectCourse) {
        return courseMapper.addStudentCourseTeacher(selectCourse);
    }


}
