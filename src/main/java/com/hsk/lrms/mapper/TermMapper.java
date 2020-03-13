package com.hsk.lrms.mapper;

import com.hsk.lrms.entity.Term;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TermMapper {
    int deleteByPrimaryKey(Integer termId);

    int insert(Term record);

    int insertSelective(Term record);

    Term selectByPrimaryKey(Integer termId);

    int updateByPrimaryKeySelective(Term record);

    int updateByPrimaryKey(Term record);

    List<Term> getListTerm();
}