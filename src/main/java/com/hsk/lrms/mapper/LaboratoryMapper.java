package com.hsk.lrms.mapper;

import com.hsk.lrms.entity.Laboratory;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LaboratoryMapper {
    int deleteByPrimaryKey(Integer labId);

    int insert(Laboratory record);

    int insertSelective(Laboratory record);

    Laboratory selectByPrimaryKey(Integer labId);

    int updateByPrimaryKeySelective(Laboratory record);

    int updateByPrimaryKey(Laboratory record);

    List<Laboratory> selectAll();
}