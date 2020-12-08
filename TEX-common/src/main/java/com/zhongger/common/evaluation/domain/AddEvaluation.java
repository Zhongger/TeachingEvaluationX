package com.zhongger.common.evaluation.domain;

import java.io.Serializable;

/**
 * Created by Zhong Mingyi on 2020/12/8.
 */
public class AddEvaluation implements Serializable {
    private Integer id;
    private String studentId;
    private String courseId;
    private String teacherId;
    private Integer evaluationMetaId;
    private Double grade;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public Integer getEvaluationMetaId() {
        return evaluationMetaId;
    }

    public void setEvaluationMetaId(Integer evaluationMetaId) {
        this.evaluationMetaId = evaluationMetaId;
    }

    public Double getGrade() {
        return grade;
    }

    public void setGrade(Double grade) {
        this.grade = grade;
    }
}
