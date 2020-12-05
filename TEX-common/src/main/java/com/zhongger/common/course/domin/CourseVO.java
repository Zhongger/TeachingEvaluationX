package com.zhongger.common.course.domin;

/**
 * Created by Zhong Mingyi on 2020/12/5.
 */
public class CourseVO {
    private String courseId;
    private String courseName;
    private String courseDeptName;
    private String courseType;
    private String courseTeacherName;
    private Integer courseTime;
    private Double courseScore;
    private String selectStatus;
    private String teacherId;

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public String getSelectStatus() {
        return selectStatus;
    }

    public void setSelectStatus(String selectStatus) {
        this.selectStatus = selectStatus;
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

    public String getCourseDeptName() {
        return courseDeptName;
    }

    public void setCourseDeptName(String courseDeptName) {
        this.courseDeptName = courseDeptName;
    }

    public String getCourseType() {
        return courseType;
    }

    public void setCourseType(String courseType) {
        this.courseType = courseType;
    }

    public String getCourseTeacherName() {
        return courseTeacherName;
    }

    public void setCourseTeacherName(String courseTeacherName) {
        this.courseTeacherName = courseTeacherName;
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
}
