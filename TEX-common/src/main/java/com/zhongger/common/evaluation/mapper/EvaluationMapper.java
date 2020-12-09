package com.zhongger.common.evaluation.mapper;

import com.zhongger.common.evaluation.domain.AddEvaluation;
import com.zhongger.common.evaluation.domain.Evaluation;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by Zhong Mingyi on 2020/12/8.
 */
@Mapper
public interface EvaluationMapper {

    List<Evaluation> selectEvaluationList(AddEvaluation evaluation);

    int insertStudentCourseEvaluation(AddEvaluation addEvaluation);

    List<Evaluation> selectAllEvaluationList();

    int checkEvaluationInsert(AddEvaluation addEvaluation);

    void updateStudentCourseEvaluation(AddEvaluation addEvaluation);
}
