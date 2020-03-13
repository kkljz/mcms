package com.hsk.lrms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Hu Shengkai
 * @create 2020-01-26 19:09
 */
@Controller
public class PageController {
    @RequestMapping("/page/{view}")
    public String page(@PathVariable("view") String view){
        return view;
    }

}
