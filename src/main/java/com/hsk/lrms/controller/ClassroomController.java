package com.hsk.lrms.controller;

import com.hsk.lrms.entity.Laboratory;
import com.hsk.lrms.service.ClassroomService;
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
import java.util.List;

/**
 * 多媒体教室
 * @author Hu Shengkai
 * @create 2020-01-29 15:55
 */
@Controller
public class ClassroomController {
    @Autowired
    private ClassroomService classroomService;

    private Logger logger = LoggerFactory.getLogger(ClassroomController.class);

    /**
     * 添加多媒体教室
     * @param laboratory
     * @return
     */
    @RequestMapping("/addClassroom")
    @ResponseBody
    public ExecResult addLab(Laboratory laboratory){
        ExecResult er = new ExecResult();
        int result = classroomService.addClassroom(laboratory);
        if(result>0){
            er.setMsg("新增成功");
            er.setSuccess(true);
        }
        else{
            er.setMsg("新增失败");
            er.setSuccess(false);
        }
        return er;
    }

    @RequestMapping("/classroomList")
    public ModelAndView getAllLab(){
        ModelAndView view=new ModelAndView("labList");
        List<Laboratory> labList=classroomService.getAllClassroom();

        view.addObject("labList",labList);
        return view;
    }

    /**
     * 得到教室详细信息，前去修改页
     * @param labId
     * @return
     */
    @RequestMapping("/getLabById")
    public ModelAndView getLabById(Integer labId){
        ModelAndView view=new ModelAndView("updateLab");
        Laboratory lab=classroomService.getLabById(labId);
        view.addObject("lab",lab);
        return view;
    }

    /**
     * 修改教室信息
     * @param laboratory
     * @return
     */
    @RequestMapping("updateLab")
    @ResponseBody
    public ExecResult updateLab(Laboratory laboratory){
        ExecResult er=new ExecResult();
        boolean isUpdate=classroomService.updateLab(laboratory);
        if(isUpdate){
            er.setMsg("更新成功");
            er.setSuccess(true);
        }
        else{
            er.setMsg("更新失败");
            er.setSuccess(false);
        }
        return er;
    }
}
