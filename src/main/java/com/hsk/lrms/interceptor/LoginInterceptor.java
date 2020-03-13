package com.hsk.lrms.interceptor;

import com.hsk.lrms.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author Hu Shengkai
 * @create 2020-01-29 14:22
 */
public class LoginInterceptor implements HandlerInterceptor{

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loginuser");
        if (user == null){
            //返回到登录界面
            response.sendRedirect("/login.jsp");
            return false;
        }
        return true;
    }
}
