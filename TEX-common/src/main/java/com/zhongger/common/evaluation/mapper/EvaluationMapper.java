package com.zhongger.common.evaluation.mapper;

import com.zhongger.common.evaluation.domain.AddEvaluation;
import com.zhongger.common.evaluation.domain.Evaluation;
import com.zhongger.common.evaluation.domain.EvaluationPO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Zhong Mingyi on 2020/12/8.
 */
@Mapper
public interface EvaluationMapper {

    List<Evaluation> selectEvaluationList(AddEvaluation evaluation);

    int insertStudentCourseEvaluation(AddEvaluation addEvaluation);

    List<Evaluation> selectAllEvaluationList();


    List<Evaluation> selectAllEvaluationListByStudentSelect(@Param("studentId") String studentId, @Param("teacherId") String teacherId, @Param("courseId") String courseId);

    int checkEvaluationInsert(AddEvaluation addEvaluation);

    void updateStudentCourseEvaluation(AddEvaluation addEvaluation);

    List<Evaluation> listEvaluationResult();

}
