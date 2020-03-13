package com.hsk.lrms.service.impl;

import com.hsk.lrms.entity.Laboratory;
import com.hsk.lrms.mapper.LaboratoryMapper;
import com.hsk.lrms.service.ClassroomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Hu Shengkai
 * @create 2020-01-29 16:09
 */
@Service
public class ClassroomServiceImpl implements ClassroomService {
    @Autowired
    private LaboratoryMapper laboratoryMapper;


    @Transactional
    @Override
    public int addClassroom(Laboratory laboratory) {
        return laboratoryMapper.insert(laboratory);
    }

    @Override
    public List<Laboratory> getAllClassroom() {
        return laboratoryMapper.selectAll();
    }

    @Override
    public Laboratory getLabById(Integer labId) {
        return laboratoryMapper.selectByPrimaryKey(labId);
    }

    @Override
    public boolean updateLab(Laboratory laboratory) {
        int row = laboratoryMapper.updateByPrimaryKeySelective(laboratory);
        if (row>0)
            return true;
        return false;
    }
}
