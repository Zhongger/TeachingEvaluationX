package com.zhongger.common.course.mapper;

import com.zhongger.common.course.domin.Course;
import com.zhongger.common.course.domin.CourseVO;
import com.zhongger.common.course.domin.SelectCourse;
import com.zhongger.common.course.domin.SelectCourseVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Zhong Mingyi on 2020/12/5.
 */
@Mapper
public interface CourseMapper {

    int checkCourseIdUnique(@Param("courseId") String courseId);

    int insertCourse(Course course);

    List<CourseVO> selectCourseList(Course course);

    List<SelectCourseVO> selectSelectCourseList(SelectCourse selectCourse);

    int insertStudentCourseTeacher(SelectCourse selectCourse);

    int deleteSelectCourse(SelectCourse selectCourse);

    int selectStudentCourseTeacher(SelectCourse selectCourse);

    int addStudentCourseTeacher(SelectCourse selectCourse);
}
