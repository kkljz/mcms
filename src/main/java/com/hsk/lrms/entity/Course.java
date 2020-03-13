package com.hsk.lrms.entity;

import lombok.Data;

@Data
public class Course {
    private Integer courseId;

    private String courseNumber;

    private String courseName;

    private String courseDescription;

    private Integer jsId;

    private Integer personNumber;

}