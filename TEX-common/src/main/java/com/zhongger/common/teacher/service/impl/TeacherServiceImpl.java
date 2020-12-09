package com.zhongger.common.teacher.service.impl;

import com.zhongger.common.course.domin.CourseVO;
import com.zhongger.common.evaluation.domain.Evaluation;
import com.zhongger.common.student.domain.StudentVO;
import com.zhongger.common.teacher.domain.TeacherVO;
import com.zhongger.common.teacher.mapper.TeacherMapper;
import com.zhongger.common.teacher.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Zhong Mingyi on 2020/12/4.
 */
@Service
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherMapper teacherMapper;

    @Override
    public List<TeacherVO> selectTeacherList(String teacherId, String roleKey) {
        return teacherMapper.selectTeacherList(teacherId, roleKey);
    }

    @Override
    public List<CourseVO> listTeacherCourse(String username) {
        return teacherMapper.listTeacherCourse(username);
    }

    @Override
    public List<StudentVO> listEvaluationStudent(String username, String courseId) {
        return teacherMapper.listEvaluationStudent(username,courseId);
    }

    @Override
    public List<Evaluation> listEvaluationDetail(String username, String courseId, String studentId) {
        return teacherMapper.listEvaluationDetail(username,courseId,studentId);
    }
}
