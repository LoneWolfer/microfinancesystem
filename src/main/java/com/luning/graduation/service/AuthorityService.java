package com.luning.graduation.service;


import com.luning.graduation.entity.SystemMenuBo;

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
}
