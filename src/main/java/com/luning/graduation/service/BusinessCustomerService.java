package com.luning.graduation.service;

import com.luning.graduation.entity.BusinessCustomerBo;

import java.util.List;

/**
 * @author ln
 * 客户数据操作的service层接口
 */
public interface BusinessCustomerService {
    /**
     * 根据id查询单个客户
     *
     * @param id 用户id
     * @return BusinessCustomerBo
     */
    BusinessCustomerBo getCustomer(Long id);

    /**
     * 查询所有客户
     *
     * @return List
     */
    List<BusinessCustomerBo> listCustomer();

    /**
     * 插入单个客户
     *
     * @param businessCustomerBo 客户对象
     * @return int 1:插入成功 0:插入失败
     */
    int insertCustomer(BusinessCustomerBo businessCustomerBo);

    /**
     * 删除单个客户
     *
     * @param id 用户id
     * @return int 1:删除成功 0:删除失败
     */
    int deleteCustomer(Long id);

    /**
     * 更新客户信息
     *
     * @param businessCustomerBo 客户对象
     * @return int 1:更新成功 0:更新失败
     */
    int updateCustomer(BusinessCustomerBo businessCustomerBo);

    /**
     * 统计所有客户数
     *
     * @return int 值为客户数
     */
    int countCustomer();

    /**
     * 客户拉黑名单
     *
     * @param id 客户id
     * @return int
     */
    int forbidCustomer(Long id);

    /**
     * 根据客户姓名查询
     *
     * @param customerName 姓名
     * @return BusinessCustomerBo
     */
    BusinessCustomerBo getByName(String customerName);

    /**
     * 黑名单列表
     *
     * @return list
     */
    List<BusinessCustomerBo> listBlack();

    /**
     * 取消黑名单
     *
     * @param id 客户id
     * @return int
     */
    int updateBlack(Long id);

    /**
     * 根据客户姓名黑名单查询
     *
     * @param customerName 姓名
     * @return BusinessCustomerBo
     */
    BusinessCustomerBo getByBlackName(String customerName);
}
