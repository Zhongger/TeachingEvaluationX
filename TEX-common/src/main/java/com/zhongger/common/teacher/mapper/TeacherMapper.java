package com.zhongger.common.teacher.mapper;

import com.zhongger.common.course.domin.CourseVO;
import com.zhongger.common.evaluation.domain.Evaluation;
import com.zhongger.common.student.domain.StudentVO;
import com.zhongger.common.teacher.domain.TeacherVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Zhong Mingyi on 2020/12/4.
 */
public interface TeacherMapper {
    List<TeacherVO> selectTeacherList(@Param("teacherId") String teacherId, @Param("roleKey") String roleKey);

    int insertTeacher(@Param("teacherId") String teacherId, @Param("userId") Long userId);

    List<CourseVO> listTeacherCourse(@Param("teacherId") String username);

    List<StudentVO> listEvaluationStudent(@Param("teacherId") String teacherId, @Param("courseId") String courseId);

    List<Evaluation> listEvaluationDetail(@Param("teacherId") String teacherId,  @Param("courseId") String courseId,
                                          @Param("studentId")  String studentId);

    List<Evaluation> listEvaluationSum(@Param("teacherId") String teacherId);

    List<Evaluation> listEvaluationCourseSumList(@Param("teacherId")String username,@Param("evaluationMetaIds") List<Integer> evaluationMetaIds);
}
