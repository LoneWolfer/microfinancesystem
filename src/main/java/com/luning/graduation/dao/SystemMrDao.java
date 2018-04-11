package com.luning.graduation.dao;

import com.luning.graduation.entity.SystemMrBo;

public interface SystemMrDao {
    int deleteByPrimaryKey(Long id);

    int insert(SystemMrBo record);

    int insertSelective(SystemMrBo record);

    SystemMrBo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SystemMrBo record);

    int updateByPrimaryKey(SystemMrBo record);
}