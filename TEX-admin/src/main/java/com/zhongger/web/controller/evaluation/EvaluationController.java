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

import java.util.ArrayList;
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
    public TableDataInfo list(EvaluationPO evaluationPO) {
        AddEvaluation evaluation = new AddEvaluation();
        evaluation.setStudentId(SecurityUtils.getUsername());
        evaluation.setTeacherId(evaluationPO.getTeacherId());
        evaluation.setCourseId(evaluationPO.getCourseId());
        startPage();
        List<Evaluation> list = evaluationService.selectAllEvaluationList();
        return getDataTable(list);
    }

    @PostMapping("/addEvaluation")
    public AjaxResult addEvaluation(@RequestBody EvaluationPO evaluationPO) {
        AddEvaluation addEvaluation = new AddEvaluation();
        addEvaluation.setStudentId(SecurityUtils.getUsername());
        addEvaluation.setTeacherId(evaluationPO.getTeacherId());
        addEvaluation.setCourseId(evaluationPO.getCourseId());
        Integer row = 0;
        int count = evaluationService.checkEvaluationInsert(addEvaluation);
        if (count > 0) {
            return toAjax(count);
        }
        List<Evaluation> list = evaluationService.selectAllEvaluationList();
        for (Evaluation evaluation : list) {
            addEvaluation.setEvaluationMetaId(evaluation.getId());
            evaluationService.insertStudentCourseEvaluation(addEvaluation);
            row++;
        }
        return toAjax(row);
    }

    /**
     * 前端传入数组，后端用List接收
     *
     * @param evaluationList
     * @return
     */
    @PostMapping("/updateEvaluation")
    public AjaxResult updateEvaluation(@RequestBody List<Evaluation> evaluationList) {
        String studentId = SecurityUtils.getUsername();
        int row = 0;
        List<AddEvaluation> addEvaluationList = new ArrayList<>();
        for (Evaluation evaluation : evaluationList) {
            AddEvaluation addEvaluation = new AddEvaluation();
            addEvaluation.setStudentId(studentId);
            addEvaluation.setCourseId(evaluation.getCourseId());
            addEvaluation.setTeacherId(evaluation.getTeacherId());
            addEvaluation.setEvaluationMetaId(evaluation.getEvaluationMetaId());
            if (evaluation.getGrade() < 0 || evaluation.getGrade() > evaluation.getScore()) {
                return AjaxResult.error("评价失败，评价项目" + evaluation.getEvaluationMetaId() + "中：评分不能小于0或大于满分！");
            }
            addEvaluation.setGrade(evaluation.getGrade());
            addEvaluationList.add(addEvaluation);
        }
        for (AddEvaluation addEvaluation : addEvaluationList) {
            evaluationService.updateStudentCourseEvaluation(addEvaluation);
            row++;
        }
        return toAjax(row);
    }
}
