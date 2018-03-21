package com.luning.graduation.dao;

import com.luning.graduation.model.bo.TestBo;

import java.util.List;

/**
 * @author ln
 * 用于测试的DAO层
 */
public interface TestDao {
    /**
     * 测试方法，查询测试表中所有数据
     *
     * @return List
     */
    List<TestBo> test();
}
