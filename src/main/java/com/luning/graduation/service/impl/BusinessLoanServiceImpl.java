package com.luning.graduation.service.impl;

import com.luning.graduation.LoanRepayEnum;
import com.luning.graduation.LoanTypeEnum;
import com.luning.graduation.dao.BusinessCustomerDao;
import com.luning.graduation.dao.BusinessLoanDao;
import com.luning.graduation.dao.SystemUserDao;
import com.luning.graduation.entity.BusinessCustomerBo;
import com.luning.graduation.entity.BusinessLoanBo;
import com.luning.graduation.entity.CountApplyBo;
import com.luning.graduation.entity.SystemUserBo;
import com.luning.graduation.service.BusinessLoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author ln
 * 贷款申请数据操作的service层实现类
 */
@Service
public class BusinessLoanServiceImpl implements BusinessLoanService {

    @Autowired
    private BusinessLoanDao businessLoanDao;
    @Autowired
    private SystemUserDao systemUserDao;
    @Autowired
    private BusinessCustomerDao businessCustomerDao;

    @Override
    public BusinessLoanBo getLoan(Long id) {
        BusinessLoanBo businessLoanBo = businessLoanDao.getLoan(id);
        if (businessLoanBo.getUserId() != null){
            SystemUserBo systemUserBo = systemUserDao.getSystemUser(businessLoanBo.getUserId());
            businessLoanBo.setUserName(systemUserBo.getUserName());
        }
        if (businessLoanBo.getCustomerId() != null){
            BusinessCustomerBo businessCustomerBo = businessCustomerDao.getCustomer(businessLoanBo.getCustomerId());
            businessLoanBo.setCustomerName(businessCustomerBo.getCustomerName());
        }
        String typeName = LoanTypeEnum.getName(businessLoanBo.getLoanType());
        businessLoanBo.setTypeName(typeName);
        String repayName = LoanRepayEnum.getName(businessLoanBo.getLoanRepayment());
        businessLoanBo.setRepayName(repayName);
        return businessLoanBo;
    }

    @Override
    public List<BusinessLoanBo> listLoan() {
        List<BusinessLoanBo> businessLoanBoList = businessLoanDao.listLoan();
        packLoanBo(businessLoanBoList);
        return businessLoanBoList;
    }

    @Override
    public int insertLoan(BusinessLoanBo businessLoanBo) {
        return businessLoanDao.insertLoan(businessLoanBo);
    }

    @Override
    public int deleteLoan(Long id) {
        return businessLoanDao.deleteLoan(id);
    }

    @Override
    public int updateLoan(BusinessLoanBo businessLoanBo) {
        return businessLoanDao.updateLoan(businessLoanBo);
    }

    @Override
    public int countLoan() {
        return businessLoanDao.countLoan();
    }

    @Override
    public List<BusinessLoanBo> listSchedule() {
        List<BusinessLoanBo> businessLoanBoList = businessLoanDao.listSchedule();
        packLoanBo(businessLoanBoList);
        return businessLoanBoList;
    }

    @Override
    public int passSchedule(Long id) {
        return businessLoanDao.passSchedule(id);
    }

    @Override
    public int refuseSchedule(Long id) {
        return businessLoanDao.refuseSchedule(id);
    }

    @Override
    public List<BusinessLoanBo> listDone() {
        List<BusinessLoanBo> businessLoanBoList = businessLoanDao.listDone();
        packLoanBo(businessLoanBoList);
        return businessLoanBoList;
    }

    @Override
    public List<BusinessLoanBo> listSearch(Map<String, Object> searchMap) {
        List<BusinessLoanBo> businessLoanBoList = businessLoanDao.listSearch(searchMap);
        packLoanBo(businessLoanBoList);
        return businessLoanBoList;
    }

    @Override
    public List<CountApplyBo> countByDay() {
        return businessLoanDao.countByDay();
    }

    private void packLoanBo(List<BusinessLoanBo> businessLoanBoList) {
        businessLoanBoList.forEach(businessLoanBo -> {
            if (businessLoanBo.getUserId() != null){
                SystemUserBo systemUserBo = systemUserDao.getSystemUser(businessLoanBo.getUserId());
                businessLoanBo.setUserName(systemUserBo.getUserName());
            }
            if (businessLoanBo.getCustomerId() != null){
                BusinessCustomerBo businessCustomerBo = businessCustomerDao.getCustomer(businessLoanBo.getCustomerId());
                businessLoanBo.setCustomerName(businessCustomerBo.getCustomerName());
            }
            String typeName = LoanTypeEnum.getName(businessLoanBo.getLoanType());
            businessLoanBo.setTypeName(typeName);
            String repayName = LoanRepayEnum.getName(businessLoanBo.getLoanRepayment());
            businessLoanBo.setRepayName(repayName);
        });
    }
}
