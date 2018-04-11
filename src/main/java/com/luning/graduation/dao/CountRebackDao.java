package com.luning.graduation.dao;

import com.luning.graduation.entity.CountRebackBo;

public interface CountRebackDao {
    int deleteByPrimaryKey(Long id);

    int insert(CountRebackBo record);

    int insertSelective(CountRebackBo record);

    CountRebackBo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(CountRebackBo record);

    int updateByPrimaryKey(CountRebackBo record);
}