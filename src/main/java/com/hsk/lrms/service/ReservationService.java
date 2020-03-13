package com.hsk.lrms.service;

import com.hsk.lrms.bean.LabReservationVo;
import com.hsk.lrms.bean.LabUserReservationVo;
import com.hsk.lrms.bean.ReserveSelectBean;
import com.hsk.lrms.bean.UserClassroomReserveVo;
import com.hsk.lrms.entity.Reservation;
import com.hsk.lrms.util.ExecResult;

import java.util.List;

/**
 * @author Hu Shengkai
 * @create 2020-02-20 21:00
 */
public interface ReservationService {

    /**
     * 高级搜索动态查询
     * @param selectBean
     * @return
     */
    public List<UserClassroomReserveVo> denamicSelect(ReserveSelectBean selectBean);


    /**
     * 查询教室预约情况
     * @param labId
     * @return
     */
    public List<LabReservationVo> selectLabReserveById(Integer labId);

    /**
     * 个人预约
     * @param reservation
     * @return
     */
    public ExecResult personalReserveLab(Reservation reservation);

    /**
     * 查询用户的预约情况
     * @param userId
     * @return
     */
    public List<LabUserReservationVo> reservationByUserId(int userId);
}
