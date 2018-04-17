package com.luning.graduation.dao;

import com.luning.graduation.entity.SystemUserBo;

import java.util.List;

/**
 * @author ln
 * 系统用户数据操作的DAO层
 */
public interface SystemUserDao {
    /**
     * 根据id查询单个用户
     *
     * @param id 用户id
     * @return SystemUserBo
     */
    SystemUserBo getSystemUser(Long id);

    /**
     * 查询所有用户
     *
     * @return List
     */
    List<SystemUserBo> listSystemUser();

    /**
     * 插入单个用户
     *
     * @param systemUserBo 用户对象
     * @return int 1:插入成功 0:插入失败
     */
    int insertSystemUser(SystemUserBo systemUserBo);

    /**
     * 删除单个用户
     *
     * @param id 用户id
     * @return int 1:删除成功 0:删除失败
     */
    int deleteSystemUser(Long id);

    /**
     * 更新用户信息
     *
     * @param systemUserBo 用户对象
     * @return int 1:更新成功 0:更新失败
     */
    int updateSystemUser(SystemUserBo systemUserBo);

    /**
     * 统计所有系统用户数
     *
     * @return int 值为系统用户数
     */
    int countSystemUser();

    /**
     * 登陆验证
     *
     * @param systemUserBo 账号密码对象
     * @return SystemUserBo 系统用户对象
     */
    List<SystemUserBo> validate(SystemUserBo systemUserBo);

    /**
     * 根据用户名查询账号信息
     *
     * @param userName 账号名
     * @return SystemUserBo 用户对象
     */
    SystemUserBo getByName(String userName);

    /**
     * 根据用户名查询账号集合
     *
     * @param userName 账号名
     * @return list
     */
    List<SystemUserBo> listByName(String userName);
}
