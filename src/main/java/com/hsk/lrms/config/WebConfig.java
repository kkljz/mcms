package com.hsk.lrms.config;

import com.hsk.lrms.interceptor.LoginInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * 拦截器配置
 * @author Hu Shengkai
 * @create 2020-01-29 14:25
 */
@Configuration
public class WebConfig extends WebMvcConfigurerAdapter {
    @Bean
    public LoginInterceptor loginInterceptor(){
        return new LoginInterceptor();
    }

    /*
     多个拦截器组成一个拦截器链
     addPathPatterns 用于添加拦截规则
     excludePathPatterns 用户排除拦截
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(loginInterceptor())//添加拦截器
                .addPathPatterns("/**") //拦截所有请求
                .excludePathPatterns("/login","/login.jsp","/static/**","/**.jsp");//对应的不拦截的请求
    }
}
