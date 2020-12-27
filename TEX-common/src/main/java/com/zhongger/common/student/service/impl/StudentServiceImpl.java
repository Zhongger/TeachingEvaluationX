package com.zhongger.common.student.service.impl;

import com.zhongger.common.student.domain.StudentVO;
import com.zhongger.common.student.mapper.StudentMapper;
import com.zhongger.common.student.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Zhong Mingyi on 2020/12/4.
 */
@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper studentMapper;


    @Override
    public List<StudentVO> selectStudentList(String studentId, String roleKey) {

        List<StudentVO> studentVOS = studentMapper.selectStudentList(studentId, roleKey);
        studentVOS.forEach(studentVO -> {
            if (studentVO.getSex().equals("0")){
                studentVO.setSex("男");
            }else {
                studentVO.setSex("女");
            }
        });
        return studentVOS;
    }
}
