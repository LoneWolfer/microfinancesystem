package com.luning.graduation.service;


import com.luning.graduation.entity.SystemMenuBo;
import com.luning.graduation.entity.SystemMrBo;
import com.luning.graduation.entity.SystemRoleBo;
import com.luning.graduation.entity.SystemUrBo;

import java.util.List;

/**
 * @author ln
 * 权限管理的Service层接口
 */
public interface AuthorityService {
    /**
     * 根据用户id查询权限菜单
     *
     * @param userId 系统用户id
     * @return List<SystemMenuBo>
     */
    List<SystemMenuBo> listMenuByUserId(Long userId);

    List<SystemRoleBo> listRole();

    int deleteRole(Long id);

    int updateRole(SystemRoleBo systemRoleBo);

    int insertRole(SystemRoleBo systemRoleBo);

    SystemRoleBo getRole(Long id);

    boolean updateMrBatch(Long rId, Long[] menuIds);

    int clearMr(Long roleId);

    int insertUr(SystemUrBo systemUrBo);

    int updateUr(SystemUrBo systemUrBo);

    int insertMr(SystemMrBo systemMrBo);

    SystemRoleBo getRoleByName(String roleName);
}
