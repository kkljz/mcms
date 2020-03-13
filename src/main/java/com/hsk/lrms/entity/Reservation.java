package com.hsk.lrms.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class Reservation {
    private Integer reserveId;

    private Integer labId; //多媒体教室id

    private Integer userId; //预约人id

    private Integer reserveType; //预约类型 1—个人预约;2—为指定课堂预约

    private Integer courseId; //0代表没有选择课堂

    private String coursename; //课程名称

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date reserveDate; //预约日期

    //预约时间段 1--8:00~10:00 2—10:00~12:00 3—14:00~16:00 4—16:00~18:00 5—19:00~21:00
    private Integer timeInterval;

    //表示星期几，取值为1,2,3,4,5,6,7 1--周一、2—周二、3--周三、4—周四 、5--周五、6—周六、7--周日
    private Integer weekday;

    //预约人数，1-学生预约，n-教师预约或者教师指定;预约人数应该小于实验室当前可容纳人数
    private Integer personNumber;

    private String description; //预约描述

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime; //创建预约表单的时间

    private Date modifyTime; //修改预约表单信息后的时间

}