package com.hsk.lrms.mapper;

import com.hsk.lrms.bean.LabScheduleBean;
import com.hsk.lrms.entity.Schedule;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

@Mapper
public interface ScheduleMapper {
    int deleteByPrimaryKey(Integer scheduleId);

    int insert(Schedule record);

    int insertSelective(Schedule record);

    Schedule selectByPrimaryKey(Integer scheduleId);

    int updateByPrimaryKeySelective(Schedule record);

    int updateByPrimaryKey(Schedule record);

    List<Schedule> selectAllScheduleBylabId(Integer labId);

    List<LabScheduleBean> selectAllLabScheduleBeanByLabId(Integer labId);

    LabScheduleBean selectLabScheduleBeanByLabIdAndScheduleDate(@Param("scheduleDate") Date scheduleDate, @Param("labId") Integer labId);
}