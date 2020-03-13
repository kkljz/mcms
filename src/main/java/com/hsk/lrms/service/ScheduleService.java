package com.hsk.lrms.service;

import com.hsk.lrms.bean.LabScheduleBean;
import com.hsk.lrms.entity.Schedule;

import java.util.List;

/**
 * 教室排期
 * @author Hu Shengkai
 * @create 2020-01-30 16:29
 */
public interface ScheduleService {

    public List<LabScheduleBean> getScheduleTable(Integer labId);
}
