package com.luning.graduation.service;

import com.luning.graduation.model.bo.TestBo;

import java.util.List;

/**
 * @author ln
 * 用于测试的service层接口
 */
public interface TestService {
    /**
     * 测试方法，查询测试表中所有数据
     * @return list
     */
    List<TestBo> test();
}
