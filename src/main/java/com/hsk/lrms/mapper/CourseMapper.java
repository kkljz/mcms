package com.hsk.lrms.mapper;

import com.hsk.lrms.entity.Course;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CourseMapper {
    int deleteByPrimaryKey(Integer courseId);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(Integer courseId);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);

    List<Course> selectByUserId(Integer userId);
}