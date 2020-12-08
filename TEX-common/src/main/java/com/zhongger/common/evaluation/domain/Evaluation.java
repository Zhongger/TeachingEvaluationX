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
