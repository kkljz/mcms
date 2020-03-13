package com.hsk.lrms.service;

import com.hsk.lrms.entity.Laboratory;

import java.util.List;

/**
 * 多媒体教室service
 * @author Hu Shengkai
 * @create 2020-01-29 16:08
 */
public interface ClassroomService {
    /**
     * 添加多媒体教室
     * @param laboratory
     * @return
     */
    public int addClassroom(Laboratory laboratory);

    /**
     * 获得多媒体教室list
     * @return
     */
    public List<Laboratory> getAllClassroom();

    /**
     * 获取教室信息
     * @param labId
     * @return
     */
    public Laboratory getLabById(Integer labId);

    /**
     * 修改教室信息
     * @param laboratory
     * @return
     */
    public boolean updateLab(Laboratory laboratory);
}
