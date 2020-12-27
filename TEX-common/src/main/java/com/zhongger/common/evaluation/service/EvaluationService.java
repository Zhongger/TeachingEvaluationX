package com.zhongger.common.evaluation.service;

import com.zhongger.common.evaluation.domain.AddEvaluation;
import com.zhongger.common.evaluation.domain.Evaluation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Zhong Mingyi on 2020/12/8.
 */

public interface EvaluationService {

    List<Evaluation> selectEvaluationList(AddEvaluation evaluation);

    List<Evaluation> selectAllEvaluationList();

    int insertStudentCourseEvaluation(AddEvaluation addEvaluation);

    int checkEvaluationInsert(AddEvaluation addEvaluation);

    void updateStudentCourseEvaluation(AddEvaluation addEvaluation);

    List<Evaluation> listEvaluationResult();

    List<Evaluation> selectAllEvaluationListByStudentSelect(@Param("studentId") String studentId, @Param("teacherId") String teacherId, @Param("courseId") String courseId);
}
