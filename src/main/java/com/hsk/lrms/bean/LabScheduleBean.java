package com.hsk.lrms.bean;

import com.hsk.lrms.entity.Schedule;
import lombok.Data;

/**
 * @author Hu Shengkai
 * @create 2020-01-30 19:10
 */
@Data
public class LabScheduleBean extends Schedule {
    private String buildingName;    //建筑名称

    private int roomNumber; //预约教室号码

    private int personNumber; //可容纳人数
}
