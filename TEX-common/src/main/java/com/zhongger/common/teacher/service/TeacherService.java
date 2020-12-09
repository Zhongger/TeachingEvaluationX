package com.zhongger.common.teacher.service;

import com.zhongger.common.course.domin.CourseVO;
import com.zhongger.common.evaluation.domain.Evaluation;
import com.zhongger.common.student.domain.StudentVO;
import com.zhongger.common.teacher.domain.TeacherVO;

import java.util.List;

/**
 * Created by Zhong Mingyi on 2020/12/4.
 */
public interface TeacherService {

    List<TeacherVO> selectTeacherList(String teacherId, String roleKey);

    List<CourseVO> listTeacherCourse(String username);

    List<StudentVO> listEvaluationStudent(String username, String courseId);

    List<Evaluation> listEvaluationDetail(String username, String courseId, String studentId);
}
