package com.zhongger.common.teacher.mapper;

import com.zhongger.common.teacher.domain.TeacherVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Zhong Mingyi on 2020/12/4.
 */
public interface TeacherMapper {
    List<TeacherVO> selectTeacherList(@Param("teacherId") String teacherId, @Param("roleKey") String roleKey);

    int insertTeacher(@Param("teacherId") String teacherId, @Param("userId") Long userId);
}
