package com.zhongger.common.teacher.service.impl;

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
}