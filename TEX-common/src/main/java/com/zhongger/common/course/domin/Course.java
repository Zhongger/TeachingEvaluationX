package com.zhongger.common.course.domin;

import com.zhongger.common.core.domain.BaseEntity;

/**
 * Created by Zhong Mingyi on 2020/12/5.
 */
public class Course extends BaseEntity {
    private Integer id;
    private String courseId;
    private String courseName;
    private Long deptId;
    private String courseType;
    private Integer courseTime;
    private Double courseScore;
    private String teacherId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public String getCourseType() {
        return courseType;
    }

    public void setCourseType(String courseType) {
        this.courseType = courseType;
    }

    public Integer getCourseTime() {
        return courseTime;
    }

    public void setCourseTime(Integer courseTime) {
        this.courseTime = courseTime;
    }

    public Double getCourseScore() {
        return courseScore;
    }

    public void setCourseScore(Double courseScore) {
        this.courseScore = courseScore;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }
}
