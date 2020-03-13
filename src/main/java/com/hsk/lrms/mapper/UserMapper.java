package com.hsk.lrms.mapper;

import com.hsk.lrms.bean.ReserveSelectBean;
import com.hsk.lrms.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User selectByLoginName(String loginName);

    List<User> selectByUserType(int userType);

}