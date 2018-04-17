package com.luning.graduation.dao;

import com.luning.graduation.entity.BusinessMoneyBo;

/**
 * @author ln
 * 贷款申请数据操作DAO层
 */
public interface BusinessMoneyDao {
    int updateMoney(BusinessMoneyBo businessMoneyBo);

    BusinessMoneyBo getMoney(Long id);
}