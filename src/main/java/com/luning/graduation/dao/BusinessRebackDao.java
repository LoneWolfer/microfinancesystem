package com.luning.graduation.dao;

import com.luning.graduation.entity.BusinessRebackBo;

public interface BusinessRebackDao {
    int deleteByPrimaryKey(Long id);

    int insert(BusinessRebackBo record);

    int insertSelective(BusinessRebackBo record);

    BusinessRebackBo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(BusinessRebackBo record);

    int updateByPrimaryKey(BusinessRebackBo record);
}