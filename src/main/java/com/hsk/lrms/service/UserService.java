package com.hsk.lrms.service;

import com.hsk.lrms.entity.Announcement;
import com.hsk.lrms.entity.Course;
import com.hsk.lrms.entity.Term;
import com.hsk.lrms.entity.User;
import com.hsk.lrms.util.ExecResult;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author Hu Shengkai
 * @create 2020-01-26 19:59
 */
public interface UserService {
    /**
     * 用户登录
     * @param loginName
     * @param password
     * @return
     */
    public User userLogin(String loginName, String password);

    /**
     * 得到所有公告
     * @return
     */
    public List<Announcement> getAnnouncement();

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    public User userUpdate(User user);

    /**
     * 得到用户list
     * @param userType
     * @return
     */
    public List<User> listUserByType(int userType);

    public ExecResult deleteUser(Integer userId);

    /**
     * 删除公告
     * @param AnnoId
     * @return
     */
    public int deleteAnnouncement(Integer AnnoId);

    /**
     * 添加公告
     * @param announcement
     * @return
     */
    public int addAnnouncement(Announcement announcement);

    /**
     * 得到学期list
     * @return
     */
    public List<Term> getTermList();

    /**
     * 通过老师id得到其所有的课程
     * @param userId
     * @return
     */
    public List<Course> getCourseList(Integer userId);
}
