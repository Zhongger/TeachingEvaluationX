package com.zhongger.common.teacher.service;

import com.zhongger.common.course.domin.CourseVO;
import com.zhongger.common.teacher.domain.TeacherVO;

import java.util.List;

/**
 * Created by Zhong Mingyi on 2020/12/4.
 */
public interface TeacherService {

    List<TeacherVO> selectTeacherList(String teacherId, String roleKey);

    List<CourseVO> listTeacherCourse(String username);
}
