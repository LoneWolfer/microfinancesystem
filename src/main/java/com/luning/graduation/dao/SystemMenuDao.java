package com.luning.graduation.dao;

import com.luning.graduation.entity.SystemMenuBo;

/**
 * @author ln
 * 菜单数据操作的DAO层
 */
public interface SystemMenuDao {
    SystemMenuBo getSystemMenu(Long id);

    SystemMenuBo getMenuByMenuId(Long menuId);
}