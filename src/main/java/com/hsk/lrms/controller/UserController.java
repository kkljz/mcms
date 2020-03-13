package com.hsk.lrms.controller;

import com.hsk.lrms.entity.Announcement;
import com.hsk.lrms.entity.User;
import com.hsk.lrms.service.UserService;
import com.hsk.lrms.util.ExecResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author Hu Shengkai
 * @create 2020-01-26 20:02
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 用户登录
     * @param user
     * @param session
     * @return
     */
    @PostMapping("/login")
    @ResponseBody
    public ExecResult login(User user, HttpSession session){
        ExecResult er=new ExecResult();
        User loginuser=userService.userLogin( user.getLoginName(), user.getPassword());
        System.out.println(loginuser);
        if(loginuser==null){
            er.setMsg("用户名或者密码错误");
            er.setSuccess(false);
        }else{
            session.setAttribute("loginuser", loginuser);
            er.setMsg("恭喜您，登陆成功！");
            er.setSuccess(true);
        }
        return er;
    }

    /**
     * 前往首页
     * @return
     */
    @RequestMapping("/index")
    public ModelAndView toMain(){
        ModelAndView view=new ModelAndView("index");
        List<Announcement> announcementList=userService.getAnnouncement();
        view.addObject("announcementList",announcementList);
        return view;
    }

    //首页显示公告列表
    @RequestMapping("AnnouncementList")
    public ModelAndView AnnouncementList(){
        ModelAndView view=new ModelAndView("AnnouncementList");
        List<Announcement> announcementList=userService.getAnnouncement();
        view.addObject("list",announcementList);
        return view;
    }

    /**
     * 用户修改
     * @param user
     * @param session
     * @return
     */
    @PostMapping("/userUpdate")
    @ResponseBody
    public ExecResult userUpdate(User user, HttpSession session){
        ExecResult er=new ExecResult();
        try {
            User updateUser = userService.userUpdate(user);
            er.setMsg("信息修改成功");
            er.setSuccess(true);
            session.setAttribute("loginuser",updateUser);
        } catch (Exception e) {
            e.printStackTrace();
            er.setMsg("信息修改失败："+e.getMessage());
            er.setSuccess(false);
        }
        return er;
    }

    /**
     * 密码修改
     * @param user
     * @return
     */
    @RequestMapping("/changePwd")
    @ResponseBody
    public ExecResult changePwd(User user){
        ExecResult er=new ExecResult();
        try {
            userService.userUpdate(user);
            er.setMsg("密码修改成功");
            er.setSuccess(true);
        } catch (Exception e) {
            e.printStackTrace();
            er.setMsg("密码修改失败："+e.getMessage());
            er.setSuccess(false);
        }
        return er;
    }

    /**
     * 得到用户list
     * @param userType
     * @return
     */
    @RequestMapping("/userList")
    public ModelAndView listUser(Integer userType){
        List<User> userList = userService.listUserByType(userType);
        ModelAndView mv = new ModelAndView("userList");
        mv.addObject("userList",userList);
        mv.addObject("userType",userType);
        return mv;
    }

    /**
     * 删除用户
     * @return
     */
    @RequestMapping("/deleteUser")
    @ResponseBody
    public ExecResult deleteUser(Integer userId){
        ExecResult execResult = new ExecResult();
        try {
            execResult = userService.deleteUser(userId);
        } catch (Exception e) {
            e.printStackTrace();
            execResult.setMsg("删除失败");
            execResult.setSuccess(false);
        }
        return execResult;
    }

    //删除公告页面  显示公告列表
    @RequestMapping("/ManageAnnouncementList")
    public ModelAndView ManageAnnouncementList(){
        ModelAndView view=new ModelAndView("deleteAnnouncementList");
        List<Announcement> announcementList=userService.getAnnouncement();
        view.addObject("list",announcementList);
        return view;
    }

    /**
     * 删除公告
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("deleteAnnouncement")
    @ResponseBody
    public ExecResult deleteAnnouncement(HttpServletRequest request, HttpSession session){
        ExecResult er=new ExecResult();
        int publish_id=Integer.parseInt(request.getParameter("publishId"));
        int result=userService.deleteAnnouncement(publish_id);
        if(result>0){
            er.setMsg("删除成功");
            er.setSuccess(true);
        }
        else{
            er.setMsg("删除失败");
            er.setSuccess(false);
        }
        return er;
    }

    /**
     * 添加公告
     * @param request
     * @param session
     * @return
     * @throws ParseException
     */
    @RequestMapping("addAnnouncement")
    @ResponseBody
    public ExecResult addAnnouncement(HttpServletRequest request,HttpSession session) throws ParseException {
        ExecResult er=new ExecResult();
        Announcement announcement=new Announcement();

        String title=request.getParameter("title");
        String content=request.getParameter("content");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date create_time = sdf.parse(request.getParameter("create_time"));
        announcement.setTitle(title);
        announcement.setContent(content);
        announcement.setCreateTime(create_time);
        int result=userService.addAnnouncement(announcement);
        if(result>0){
            er.setMsg("公告发布成功");
            er.setSuccess(true);
        }
        else{
            er.setMsg("公告发布失败");
            er.setSuccess(false);
        }
        return er;
    }


}
