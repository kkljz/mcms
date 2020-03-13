package com.hsk.lrms.bean;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author Hu Shengkai
 * @create 2020-03-05 21:41
 */
@Data
public class LabReservationVo {
    private Integer labId;

    private String buildingName; //教学楼名字

    private Integer roomNumber; //房间号

    private Integer personNumber; //可容纳人数

    private Integer isFree; //0-空闲，1-已被预约（暂时不需要）2-报修

    private Integer reserveType; //预约类型 1—个人预约;2—为指定课堂预约

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date reserveDate; //预约日期

    //预约时间段 1--8:00~10:00 2—10:00~12:00 3—14:00~16:00 4—16:00~18:00 5—19:00~21:00
    private Integer timeInterval;
}
