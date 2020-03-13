package com.hsk.lrms.service.impl;

import com.hsk.lrms.bean.LabReservationVo;
import com.hsk.lrms.bean.LabUserReservationVo;
import com.hsk.lrms.bean.ReserveSelectBean;
import com.hsk.lrms.bean.UserClassroomReserveVo;
import com.hsk.lrms.entity.Reservation;
import com.hsk.lrms.mapper.ReservationMapper;
import com.hsk.lrms.service.ReservationService;
import com.hsk.lrms.util.ExecResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Time;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.WeekFields;
import java.util.Date;
import java.util.List;

/**
 * @author Hu Shengkai
 * @create 2020-02-20 21:01
 */
@Service
public class ReservationServiceImpl implements ReservationService {
    @Autowired
    private ReservationMapper reservationMapper;

    @Override
    public List<UserClassroomReserveVo> denamicSelect(ReserveSelectBean selectBean) {
        return reservationMapper.dynamicSelect(selectBean);
    }

    @Override
    public List<LabReservationVo> selectLabReserveById(Integer labId) {
        return reservationMapper.selectLabReserveById(labId);
    }

    @Override
    @Transactional
    public ExecResult personalReserveLab(Reservation reservation) {
        ExecResult execResult = new ExecResult();
        int reserveCount = reservationMapper.getLabReserveByLabIdAndTimeIntervalAndReserveDate(
                reservation.getLabId(),
                reservation.getTimeInterval(),
                reservation.getReserveDate());
        if (reserveCount>0){
            execResult.setSuccess(false);
            execResult.setMsg("预约失败，该时间已被其他人预约");
            return execResult;
        }
        reservation.setCreateTime(new Date());
        Date date = reservation.getReserveDate();
        if (date!=null){
            LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            Integer week = localDate.get(WeekFields.of(DayOfWeek.of(1), 1).dayOfWeek());
            reservation.setWeekday(week);
        }
        reservationMapper.insertSelective(reservation);
        execResult.setSuccess(true);
        execResult.setMsg("预约成功");
        return execResult;
    }

    @Override
    public List<LabUserReservationVo> reservationByUserId(int userId) {
        return reservationMapper.selectLabReserveByUserId(userId);
    }
}
