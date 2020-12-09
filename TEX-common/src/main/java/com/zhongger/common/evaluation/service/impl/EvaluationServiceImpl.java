package com.zhongger.common.evaluation.service.impl;

import com.zhongger.common.evaluation.domain.AddEvaluation;
import com.zhongger.common.evaluation.domain.Evaluation;
import com.zhongger.common.evaluation.mapper.EvaluationMapper;
import com.zhongger.common.evaluation.service.EvaluationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Zhong Mingyi on 2020/12/8.
 */
@Service
public class EvaluationServiceImpl implements EvaluationService {
    @Autowired
    private EvaluationMapper evaluationMapper;

    @Override
    public List<Evaluation> selectEvaluationList(AddEvaluation evaluation) {
        return evaluationMapper.selectEvaluationList(evaluation);
    }

    @Override
    public List<Evaluation> selectAllEvaluationList() {
        return evaluationMapper.selectAllEvaluationList();
    }

    @Override
    public int insertStudentCourseEvaluation(AddEvaluation addEvaluation) {
        return evaluationMapper.insertStudentCourseEvaluation(addEvaluation);
    }

    @Override
    public int checkEvaluationInsert(AddEvaluation addEvaluation) {
        return evaluationMapper.checkEvaluationInsert(addEvaluation);
    }

    @Override
    public void updateStudentCourseEvaluation(AddEvaluation addEvaluation) {
         evaluationMapper.updateStudentCourseEvaluation(addEvaluation);
    }
}
