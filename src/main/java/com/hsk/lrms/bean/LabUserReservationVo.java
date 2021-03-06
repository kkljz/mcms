package com.hsk.lrms.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * @author Hu Shengkai
 * @create 2020-03-12 16:41
 */
@Data
public class LabUserReservationVo {
    private String buildingName; //教学楼名字

    private Integer roomNumber; //房间号

    private Integer reserveId;

    private Integer reserveType; //预约类型 1—个人预约;2—为指定课堂预约

    private Integer userType; //用户类型0-管理员，1-教师，2-学生

    private String userName;

    private String courseName; //课程名称

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date reserveDate; //预约日期

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime; //预约创建时间

    //预约时间段 1--8:00~10:00 2—10:00~12:00 3—14:00~16:00 4—16:00~18:00 5—19:00~21:00
    private Integer timeInterval;

    //预约人数，1-学生预约，n-教师预约或者教师指定;预约人数应该小于实验室当前可容纳人数
    private Integer personNumber;

    private String description; //预约描述
}
