package com.hsk.lrms.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Announcement {
    private Integer publishId;

    private String title; //主题

    private String content; //公告内容

    private Date createTime; //创建公告时的时间
}