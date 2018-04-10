package com.luning.graduation.service;

import com.luning.graduation.entity.BusinessRateBo;

import java.util.List;

/**
 * @author ln
 * 贷款利率数据操作的service层接口
 */
public interface BusinessRateService {
    /**
     * 根据id查询单个利率信息
     *
     * @param id 利率id
     * @return BusinessRateBo
     */
    BusinessRateBo getRate(Long id);

    /**
     * 查询所有利率信息
     *
     * @return List
     */
    List<BusinessRateBo> listRate();

    /**
     * 插入单个利率信息
     *
     * @param businessRateBo 贷款利率对象
     * @return int 1:插入成功 0:插入失败
     */
    int insertRate(BusinessRateBo businessRateBo);

    /**
     * 删除单个贷款利率信息
     *
     * @param id 贷款利率id
     * @return int 1:删除成功 0:删除失败
     */
    int deleteRate(Long id);

    /**
     * 更新贷款利率信息
     *
     * @param businessRateBo 贷款利率对象
     * @return int 1:更新成功 0:更新失败
     */
    int updateRate(BusinessRateBo businessRateBo);

    /**
     * 统计所有贷款利率信息
     *
     * @return int 值为贷款利率信息数
     */
    int countRate();
}
