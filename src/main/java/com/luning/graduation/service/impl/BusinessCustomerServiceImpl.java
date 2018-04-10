package com.luning.graduation.service.impl;

import com.luning.graduation.dao.BusinessCustomerDao;
import com.luning.graduation.entity.BusinessCustomerBo;
import com.luning.graduation.service.BusinessCustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author ln
 * 客户数据操作的service层实现类
 */
@Service
public class BusinessCustomerServiceImpl implements BusinessCustomerService {

    @Autowired
    private BusinessCustomerDao businessCustomerDao;

    @Override
    public BusinessCustomerBo getCustomer(Long id) {
        return businessCustomerDao.getCustomer(id);
    }

    @Override
    public List<BusinessCustomerBo> listCustomer() {
        return businessCustomerDao.listCustomer();
    }

    @Override
    public int insertCustomer(BusinessCustomerBo businessCustomerBo) {
        return businessCustomerDao.insertCustomer(businessCustomerBo);
    }

    @Override
    public int deleteCustomer(Long id) {
        return businessCustomerDao.deleteCustomer(id);
    }

    @Override
    public int updateCustomer(BusinessCustomerBo businessCustomerBo) {
        return businessCustomerDao.updateCustomer(businessCustomerBo);
    }

    @Override
    public int countCustomer() {
        return businessCustomerDao.countCustomer();
    }

    @Override
    public int forbidCustomer(Long id) {
        return businessCustomerDao.forbidCustomer(id);
    }

    @Override
    public BusinessCustomerBo getByName(String customerName) {
        return businessCustomerDao.getByName(customerName);
    }

    @Override
    public List<BusinessCustomerBo> listBlack() {
        return businessCustomerDao.listBlack();
    }

    @Override
    public int updateBlack(Long id) {
        return businessCustomerDao.updateBlack(id);
    }

    @Override
    public BusinessCustomerBo getByBlackName(String customerName) {
        return businessCustomerDao.getByBlackName(customerName);
    }
}
