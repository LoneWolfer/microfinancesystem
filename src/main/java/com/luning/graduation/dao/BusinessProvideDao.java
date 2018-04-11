package com.luning.graduation.dao;

import com.luning.graduation.entity.BusinessProvideBo;

public interface BusinessProvideDao {
    int deleteByPrimaryKey(Long id);

    int insert(BusinessProvideBo record);

    int insertSelective(BusinessProvideBo record);

    BusinessProvideBo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(BusinessProvideBo record);

    int updateByPrimaryKey(BusinessProvideBo record);
}