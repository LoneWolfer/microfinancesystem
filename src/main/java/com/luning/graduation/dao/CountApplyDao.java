package com.luning.graduation.dao;

import com.luning.graduation.entity.CountApplyBo;

public interface CountApplyDao {
    int deleteByPrimaryKey(Long id);

    int insert(CountApplyBo record);

    int insertSelective(CountApplyBo record);

    CountApplyBo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(CountApplyBo record);

    int updateByPrimaryKey(CountApplyBo record);
}