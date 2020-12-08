package com.zhongger.web.controller.evaluation;

import com.zhongger.common.core.controller.BaseController;
import com.zhongger.common.core.domain.AjaxResult;
import com.zhongger.common.core.page.TableDataInfo;
import com.zhongger.common.evaluation.domain.AddEvaluation;
import com.zhongger.common.evaluation.domain.Evaluation;
import com.zhongger.common.evaluation.domain.EvaluationPO;
import com.zhongger.common.evaluation.service.EvaluationService;
import com.zhongger.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by Zhong Mingyi on 2020/12/8.
 */
@RestController
@RequestMapping("/evaluation")
public class EvaluationController extends BaseController {

    @Autowired
    private EvaluationService evaluationService;

    @PostMapping("/list")
    public TableDataInfo list( EvaluationPO evaluationPO){
        AddEvaluation evaluation = new AddEvaluation();
        evaluation.setStudentId(SecurityUtils.getUsername());
        evaluation.setTeacherId(evaluationPO.getTeacherId());
        evaluation.setCourseId(evaluationPO.getCourseId());
        startPage();
        List<Evaluation> list = evaluationService.selectEvaluationList(evaluation);
        return getDataTable(list);
    }

    @PostMapping("/addEvaluation")
    public AjaxResult addEvaluation(@RequestBody EvaluationPO evaluationPO){
        AddEvaluation addEvaluation = new AddEvaluation();
        addEvaluation.setStudentId(SecurityUtils.getUsername());
        addEvaluation.setTeacherId(evaluationPO.getTeacherId());
        addEvaluation.setCourseId(evaluationPO.getCourseId());
        Integer row = 0;
        int count = evaluationService.checkEvaluationInsert(addEvaluation);
        if (count>0){
            return toAjax(count);
        }
        List<Evaluation> list = evaluationService.selectAllEvaluationList();
        for (Evaluation evaluation :list) {
            addEvaluation.setEvaluationMetaId(evaluation.getId());
            evaluationService.insertStudentCourseEvaluation(addEvaluation);
            row ++;
        }
        return toAjax(row);
    }

    /**
     * 前端传入数组，后端用List接收
     * @param evaluationList
     * @return
     */
    @PostMapping("/updateEvaluation")
    public AjaxResult updateEvaluation(@RequestBody List<Evaluation> evaluationList){
        System.out.println(evaluationList.toString());
        return toAjax(1);
    }
}
