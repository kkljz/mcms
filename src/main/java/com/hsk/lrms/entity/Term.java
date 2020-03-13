package com.hsk.lrms.entity;

import lombok.Data;

@Data
public class Term {
    private Integer termId;

    private String termName;

    private String fromDate;

    private String endDate;

    private String description;


}