package com.luning.graduation.dao;

import com.luning.graduation.entity.SystemUrBo;

public interface SystemUrDao {
    int deleteByPrimaryKey(Long id);

    int insert(SystemUrBo record);

    int insertSelective(SystemUrBo record);

    SystemUrBo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SystemUrBo record);

    int updateByPrimaryKey(SystemUrBo record);
}