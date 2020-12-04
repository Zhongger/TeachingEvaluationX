package com.zhongger.common.student.mapper;

import com.zhongger.common.student.domain.StudentVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Zhong Mingyi on 2020/12/4.
 */
public interface StudentMapper {
    List<StudentVO> selectStudentList(@Param("studentId") String studentId, @Param("roleKey") String roleKey);

    int insertStudent(@Param("studentId") String studentId, @Param("userId") Long userId);
}
