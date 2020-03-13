package com.hsk.lrms.mapper;

import com.hsk.lrms.bean.LabReservationVo;
import com.hsk.lrms.bean.LabUserReservationVo;
import com.hsk.lrms.bean.ReserveSelectBean;
import com.hsk.lrms.bean.UserClassroomReserveVo;
import com.hsk.lrms.entity.Reservation;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

@Mapper
public interface ReservationMapper {
    int deleteByPrimaryKey(Integer reserveId);

    int insert(Reservation record);

    int insertSelective(Reservation record);

    Reservation selectByPrimaryKey(Integer reserveId);

    int updateByPrimaryKeySelective(Reservation record);

    int updateByPrimaryKey(Reservation record);

    /**
     * 动态条件查询
     *
     * @param selectBean
     * @return
     */
    List<UserClassroomReserveVo> dynamicSelect(ReserveSelectBean selectBean);

    /**
     * 查询教室的预约情况
     *
     * @param labId
     * @return
     */
    List<LabReservationVo> selectLabReserveById(Integer labId);

    /**
     * 查询指定时间点教室是否已预约
     * @param labId
     * @param timeInterval
     * @param ReservDate
     * @return
     */
    int getLabReserveByLabIdAndTimeIntervalAndReserveDate(@Param("labId") int labId, @Param("timeInterval") int timeInterval, @Param("ReservDate") Date ReservDate);

    /**
     * 查询指定用户的预约信息
     * @param userId
     * @return
     */
    List<LabUserReservationVo> selectLabReserveByUserId(Integer userId);
}