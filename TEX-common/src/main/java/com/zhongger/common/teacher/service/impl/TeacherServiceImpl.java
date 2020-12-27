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
        List<TeacherVO> teacherVOS = teacherMapper.selectTeacherList(teacherId, roleKey);
        teacherVOS.forEach(teacherVO -> {
            if (teacherVO.getSex().equals("0")){
                teacherVO.setSex("男");
            }else {
                teacherVO.setSex("女");
            }
        });
        return teacherVOS;
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

    @Override
    public List<Evaluation> listEvaluationSum(String username) {
        return teacherMapper.listEvaluationSum(username);
    }

    @Override
    public List<Evaluation> listEvaluationCourseSumList(String username, List<Integer> evaluationMetaIds) {
        return teacherMapper.listEvaluationCourseSumList(username,evaluationMetaIds);
    }
}
