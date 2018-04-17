package com.luning.graduation.service.impl;

import com.luning.graduation.LoanRepayEnum;
import com.luning.graduation.LoanTypeEnum;
import com.luning.graduation.dao.BusinessCustomerDao;
import com.luning.graduation.dao.BusinessLoanDao;
import com.luning.graduation.dao.BusinessMoneyDao;
import com.luning.graduation.dao.SystemUserDao;
import com.luning.graduation.entity.*;
import com.luning.graduation.service.BusinessLoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    @Autowired
    private BusinessMoneyDao businessMoneyDao;

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
    public int passSchedule(BusinessLoanBo businessLoanBo) {
        return businessLoanDao.passSchedule(businessLoanBo);
    }

    @Override
    public int refuseSchedule(BusinessLoanBo businessLoanBo) {
        return businessLoanDao.refuseSchedule(businessLoanBo);
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

    @Override
    public int updateMoney(Long loanSum) {
        BusinessMoneyBo businessMoneyBo = businessMoneyDao.getMoney(1L);
        Long money = businessMoneyBo.getMoney() - loanSum;
        if (money > 0){
            businessMoneyBo.setMoney(money);
            return businessMoneyDao.updateMoney(businessMoneyBo);
        }else {
            return -1;
        }
    }

    @Override
    public BusinessMoneyBo getMoney(long l) {
        return businessMoneyDao.getMoney(l);
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
