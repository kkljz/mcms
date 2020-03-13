package com.hsk.lrms.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Schedule {
    private Integer scheduleId;

    private Integer labId;

    private Date scheduleDate; //'排期表中的某个日期'

    private Integer t1; //'时间段1的人数即8:00~10:00该实验室被预约的人数'

    private Integer t2; //'时间段2的人数即10:00~12:00该实验室被预约的人数'

    private Integer t3; //'时间段3的人数即14:00~16:00该实验室被预约的人数'

    private Integer t4; //'时间段4的人数即16:00~18:00该实验室被预约的人数'

    private Integer t5; //'时间段5的人数即\r\n19:00~21:00该实验室被预约的人数'
}