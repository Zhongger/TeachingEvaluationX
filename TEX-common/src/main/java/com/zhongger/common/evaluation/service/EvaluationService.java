package com.zhongger.common.evaluation.service;

import com.zhongger.common.evaluation.domain.AddEvaluation;
import com.zhongger.common.evaluation.domain.Evaluation;

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
}
