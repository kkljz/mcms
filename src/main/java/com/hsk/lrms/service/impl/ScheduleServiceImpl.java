package com.hsk.lrms.service.impl;

import com.hsk.lrms.bean.LabScheduleBean;
import com.hsk.lrms.entity.Laboratory;
import com.hsk.lrms.entity.Schedule;
import com.hsk.lrms.mapper.LaboratoryMapper;
import com.hsk.lrms.mapper.ScheduleMapper;
import com.hsk.lrms.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @author Hu Shengkai
 * @create 2020-01-30 16:30
 */
@Service
public class ScheduleServiceImpl implements ScheduleService {
    @Autowired
    private ScheduleMapper scheduleMapper;
    @Autowired
    private LaboratoryMapper laboratoryMapper;
    @Override
    public List<LabScheduleBean> getScheduleTable(Integer labId) {
        List<LabScheduleBean> list=new ArrayList<>();
        Laboratory laboratory = laboratoryMapper.selectByPrimaryKey(labId);
        for(int i=0; i<15; i++){
            Calendar c = Calendar.getInstance();
            //System.out.println("今天： "+sf.format(c.getTime()));
            c.add(Calendar.DAY_OF_MONTH, i);
            LabScheduleBean labSchedule = getScheduleByDate(c.getTime(),labId);
            list.add(labSchedule);
        }
        LabScheduleBean labScheduleBean = list.get(0);
        labScheduleBean.setRoomNumber(laboratory.getRoomNumber());
        labScheduleBean.setBuildingName(laboratory.getBuildingName());
        labScheduleBean.setPersonNumber(laboratory.getPersonNumber());
        list.set(0,labScheduleBean);
        return list;
    }

    private LabScheduleBean getScheduleByDate(Date selectdate, Integer labId) {
        LabScheduleBean labScheduleBean = scheduleMapper.selectLabScheduleBeanByLabIdAndScheduleDate(selectdate, labId);
        if (labScheduleBean == null){
            labScheduleBean =  new LabScheduleBean();
            labScheduleBean.setLabId(labId);
            labScheduleBean.setT1(0);
            labScheduleBean.setT2(0);
            labScheduleBean.setT3(0);
            labScheduleBean.setT4(0);
            labScheduleBean.setT5(0);
            labScheduleBean.setScheduleDate(selectdate);
            return labScheduleBean;
        }
        return labScheduleBean;
    }
}
