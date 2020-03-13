package com.hsk.lrms.entity;

import lombok.Data;

@Data
public class User {
    private Integer userId;

    private Integer userType; //用户类型0-管理员，1-教师，2-学生

    private String loginName; //'学生学号、教师职工号或者管理员工号作为登录时的用户名

    private String password; //'密码，长度6~8位，字母+数字，不能取汉字或者特殊字符

    private String userName; //用户姓名

    private Integer sex;

    private Integer age;

    private String institute; //学院

    private String major; //专业

    private Integer isFirstlogin; //是否是第一次登陆0-是  1-不是

}