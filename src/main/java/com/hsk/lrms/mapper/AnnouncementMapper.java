package com.hsk.lrms.mapper;

import com.hsk.lrms.entity.Announcement;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AnnouncementMapper {
    int deleteByPrimaryKey(Integer publishId);

    int insert(Announcement record);

    int insertSelective(Announcement record);

    Announcement selectByPrimaryKey(Integer publishId);

    int updateByPrimaryKeySelective(Announcement record);

    int updateByPrimaryKey(Announcement record);

    List<Announcement> selectAllAnnouncement();
}