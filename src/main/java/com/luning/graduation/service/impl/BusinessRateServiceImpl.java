package com.luning.graduation.service.impl;

import com.luning.graduation.dao.BusinessRateDao;
import com.luning.graduation.entity.BusinessRateBo;
import com.luning.graduation.service.BusinessRateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author ln
 * 贷款利率数据操作的service层实现类
 */
@Service
public class BusinessRateServiceImpl implements BusinessRateService {

    @Autowired
    private BusinessRateDao businessRateDao;

    @Override
    public BusinessRateBo getRate(Long id) {
        return businessRateDao.getRate(id);
    }

    @Override
    public List<BusinessRateBo> listRate() {
        return businessRateDao.listRate();
    }

    @Override
    public int insertRate(BusinessRateBo businessRateBo) {
        return businessRateDao.insertRate(businessRateBo);
    }

    @Override
    public int deleteRate(Long id) {
        return businessRateDao.deleteRate(id);
    }

    @Override
    public int updateRate(BusinessRateBo businessRateBo) {
        return businessRateDao.updateRate(businessRateBo);
    }

    @Override
    public int countRate() {
        return businessRateDao.countRate();
    }
}
