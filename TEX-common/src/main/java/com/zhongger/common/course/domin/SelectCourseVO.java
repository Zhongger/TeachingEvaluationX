package com.zhongger.common.course.domin;

/**
 * Created by Zhong Mingyi on 2020/12/5.
 */
public class SelectCourseVO extends CourseVO{

    private String evaluateStatus;//评价状态  "已评价","未评价"


    public String getEvaluateStatus() {
        return evaluateStatus;
    }

    public void setEvaluateStatus(String evaluateStatus) {
        this.evaluateStatus = evaluateStatus;
    }
}
