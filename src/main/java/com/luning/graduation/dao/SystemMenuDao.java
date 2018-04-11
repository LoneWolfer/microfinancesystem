package com.luning.graduation.dao;

import com.luning.graduation.entity.SystemMenuBo;

public interface SystemMenuDao {
    int deleteByPrimaryKey(Long id);

    int insert(SystemMenuBo record);

    int insertSelective(SystemMenuBo record);

    SystemMenuBo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SystemMenuBo record);

    int updateByPrimaryKey(SystemMenuBo record);
}