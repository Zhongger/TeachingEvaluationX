package com.zhongger.common.student.service;

import com.zhongger.common.student.domain.StudentVO;

import java.util.List;

/**
 * Created by Zhong Mingyi on 2020/12/4.
 */
public interface StudentService {

    List<StudentVO> selectStudentList(String studentId,String roleKey);
}
