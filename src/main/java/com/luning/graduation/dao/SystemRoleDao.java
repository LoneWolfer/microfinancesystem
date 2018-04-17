package com.luning.graduation.dao;

import com.luning.graduation.entity.SystemRoleBo;

import java.util.List;

public interface SystemRoleDao {
    SystemRoleBo getRole(Long id);

    List<SystemRoleBo> listRole();

    int deleteRole(Long id);

    int updateRole(SystemRoleBo systemRoleBo);

    int insertRole(SystemRoleBo systemRoleBo);

    SystemRoleBo getRoleByName(String roleName);
}