package com.hsk.lrms.bean;

import lombok.Data;

/**
 * @author Hu Shengkai
 * @create 2020-02-20 20:15
 */
@Data
public class ReserveSelectBean {
    private Integer userType; //用户类型0-管理员，1-教师，2-学生

    private String userName; //用户姓名

    private Integer reserveType; //预约类型 1—个人预约;2—为指定课堂预约

    private String from; //起始时间

    private String end; //截止时间
}
