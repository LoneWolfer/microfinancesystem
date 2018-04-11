package com.luning.graduation.dao;

import com.luning.graduation.entity.SystemRoleBo;

public interface SystemRoleDao {
    int deleteByPrimaryKey(Long id);

    int insert(SystemRoleBo record);

    int insertSelective(SystemRoleBo record);

    SystemRoleBo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SystemRoleBo record);

    int updateByPrimaryKey(SystemRoleBo record);
}