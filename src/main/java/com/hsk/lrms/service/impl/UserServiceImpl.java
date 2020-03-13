package com.hsk.lrms.service.impl;

import com.hsk.lrms.entity.Announcement;
import com.hsk.lrms.entity.Course;
import com.hsk.lrms.entity.Term;
import com.hsk.lrms.entity.User;
import com.hsk.lrms.mapper.AnnouncementMapper;
import com.hsk.lrms.mapper.CourseMapper;
import com.hsk.lrms.mapper.TermMapper;
import com.hsk.lrms.mapper.UserMapper;
import com.hsk.lrms.service.UserService;
import com.hsk.lrms.util.ExecResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author Hu Shengkai
 * @create 2020-01-26 20:17
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private AnnouncementMapper announcementMapper;
    @Autowired
    private TermMapper termMapper;
    @Autowired
    private CourseMapper courseMapper;


    @Override
    public User userLogin(String loginName, String password) {
        User user = userMapper.selectByLoginName(loginName);
        if (user!=null && user.getPassword().equals(password)){
            return user;
        }
        return null;
    }

    @Override
    public List<Announcement> getAnnouncement() {
        return announcementMapper.selectAllAnnouncement();
    }

    @Override
    public User userUpdate(User user) {
        userMapper.updateByPrimaryKeySelective(user);
        return userMapper.selectByPrimaryKey(user.getUserId());
    }

    @Override
    public List<User> listUserByType(int userType) {
        return userMapper.selectByUserType(userType);
    }

    @Override
    @Transactional
    public ExecResult deleteUser(Integer userId) {
        userMapper.deleteByPrimaryKey(userId);
        ExecResult execResult = new ExecResult();
        execResult.setSuccess(true);
        execResult.setMsg("删除成功");
        return execResult;
    }

    @Override
    public int deleteAnnouncement(Integer AnnoId) {
        return announcementMapper.deleteByPrimaryKey(AnnoId);
    }

    @Override
    public int addAnnouncement(Announcement announcement) {
        return announcementMapper.insert(announcement);
    }

    @Override
    public List<Term> getTermList() {
        return termMapper.getListTerm();
    }

    @Override
    public List<Course> getCourseList(Integer userId) {
        return courseMapper.selectByUserId(userId);
    }
}
