package com.luning.graduation.service.impl;

import com.luning.graduation.dao.TestDao;
import com.luning.graduation.model.bo.TestBo;
import com.luning.graduation.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TsetServiceImpl implements TestService {

    @Autowired
    private TestDao testDao;

    @Override
    public List<TestBo> test() {
        return testDao.test();
    }
}
