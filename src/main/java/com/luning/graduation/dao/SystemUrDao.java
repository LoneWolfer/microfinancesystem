package com.luning.graduation.dao;

import com.luning.graduation.entity.SystemUrBo;

/**
 * @author ln
 * 用户角色关联表数据操作的DAO层
 */
public interface SystemUrDao {
    /**
     * 根据用户id查询SystemUrBo对象
     *
     * @param userId 用户id
     * @return SystemUrBo
     */
    SystemUrBo getSystemUr(Long userId);


}