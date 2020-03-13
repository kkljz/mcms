package com.hsk.lrms.controller;

import com.hsk.lrms.bean.*;
import com.hsk.lrms.entity.Course;
import com.hsk.lrms.entity.Laboratory;
import com.hsk.lrms.entity.Reservation;
import com.hsk.lrms.entity.Term;
import com.hsk.lrms.service.ClassroomService;
import com.hsk.lrms.service.ReservationService;
import com.hsk.lrms.service.ScheduleService;
import com.hsk.lrms.service.UserService;
import com.hsk.lrms.util.ExecResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.List;

/**
 * 预约管理
 * @author Hu Shengkai
 * @create 2020-01-30 16:24
 */
@Controller
public class ReserveController {
    @Autowired
    private ClassroomService classroomService;
    @Autowired
    private ScheduleService scheduleService;
    @Autowired
    private ReservationService reservationService;
    @Autowired
    private UserService userService;

    private Logger logger = LoggerFactory.getLogger(ReserveController.class);

    /**
     * 获得排期表
     * @param labId
     * @return
     */
    @RequestMapping("/scheduleTable")
    public ModelAndView schedule_table(Integer labId){
        ModelAndView view=new ModelAndView("schedule_table");
        List<LabScheduleBean> list=scheduleService.getScheduleTable(labId);
        List<Laboratory> labList=classroomService.getAllClassroom();
        view.addObject("labList",labList);
        view.addObject("list",list);
        return view;
    }


    /**
     * 高级搜索
     * @param selectBean
     * @return
     */
    @RequestMapping("/selectReservation")
    public ModelAndView selectReservation(ReserveSelectBean selectBean){
        ModelAndView mv = new ModelAndView("selectReservation");
        List<UserClassroomReserveVo> reserveVoList = reservationService.denamicSelect(selectBean);
        mv.addObject("list1",reserveVoList);
        return mv;
    }

    /**
     * 教室预约list
     * @return
     */
    @RequestMapping("reserveLabList")
    public ModelAndView getreserveLabList(){
        ModelAndView view=new ModelAndView("reserveLabList");
        List<Laboratory> labList=classroomService.getAllClassroom();
        view.addObject("labList",labList);
        return view;
    }

    /**
     * 得到教室当前预约信息
     * @param labId
     * @param userId
     * @return
     */
    @RequestMapping("getLabReserveById")
    public ModelAndView getLabReserveById(Integer labId, Integer userId){
        ModelAndView view=new ModelAndView("reservation");
        List<LabReservationVo> lab_reservation_list=reservationService.selectLabReserveById(labId);
        view.addObject("lab_reservation_list",lab_reservation_list);
        view.addObject("labId", labId);

        List<Term> termList=userService.getTermList();
        view.addObject("termList",termList);

        List<Course> courseList=userService.getCourseList(userId);
        view.addObject("courseList",courseList);

        return view;
    }

    /**
     * 个人教室预约
     * @param reservation
     * @return
     * @throws ParseException
     */
    @RequestMapping("reserveLab")
    @ResponseBody
    public ExecResult reserveLab(Reservation reservation) throws ParseException {
        ExecResult execResult = null;
        try {
            execResult = reservationService.personalReserveLab(reservation);
        } catch (Exception e) {
            execResult.setSuccess(false);
            execResult.setMsg("预约失败，出现异常："+e.getMessage());
            e.printStackTrace();
        }
        return execResult;
    }


    //显示某个用户所有预约信息列表
    @RequestMapping("reservationByUser")
    public ModelAndView reservationByUser(Integer userId, Integer userType){
        ModelAndView view=new ModelAndView("manage_reservation_info");
        List<LabUserReservationVo> list=reservationService.reservationByUserId(userId);
        view.addObject("list",list);
        logger.info(list.toString());
        return view;
    }



}
