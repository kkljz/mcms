package com.hsk.lrms.entity;

import lombok.Data;

/**
 * 多媒体教室实体
 */
@Data
public class Laboratory {
    private Integer labId;

    private String buildingName; //教学楼名字

    private Integer roomNumber; //房间号

    private Integer personNumber; //可容纳人数

    private Integer isFree; //0-空闲，1-已被预约（暂时不需要）2-报修

    private String description; //实验室信息描述
}