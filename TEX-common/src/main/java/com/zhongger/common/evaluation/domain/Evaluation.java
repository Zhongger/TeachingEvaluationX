package com.zhongger.common.evaluation.domain;

import java.io.Serializable;

/**
 * Created by Zhong Mingyi on 2020/12/8.
 */
public class Evaluation implements Serializable {
    private Integer id;
    private String content;
    private Double score;
    private Double grade;
    private String courseId;
    private String teacherId;
    private String teacherName;
    private Integer evaluationMetaId;
    private String deptName;
    private String courseName;

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public Integer getEvaluationMetaId() {
        return evaluationMetaId;
    }

    public void setEvaluationMetaId(Integer evaluationMetaId) {
        this.evaluationMetaId = evaluationMetaId;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    @Override
    public String toString() {
        return "Evaluation{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", score=" + score +
                ", grade=" + grade +
                ", courseId='" + courseId + '\'' +
                ", teacherId='" + teacherId + '\'' +
                '}';
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public Double getGrade() {
        return grade;
    }

    public void setGrade(Double grade) {
        this.grade = grade;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }
}
