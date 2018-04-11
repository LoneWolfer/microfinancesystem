package com.luning.graduation.entity;

import java.math.BigDecimal;
import java.util.Date;

public class BusinessLoanBo {
    private Long id;

    private Date gmtCreate;

    private Date gmtModified;

    private Short loanType;

    private Short loanState;

    private String loanSum;

    private BigDecimal loanRate;

    private Short loanRepayment;

    private Date loanDate;

    private Integer loanPeriod;

    private Long customerId;

    private Long userId;

    private String customerName;

    private String userName;

    private String typeName;

    private String repayName;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtModified() {
        return gmtModified;
    }

    public void setGmtModified(Date gmtModified) {
        this.gmtModified = gmtModified;
    }

    public Short getLoanType() {
        return loanType;
    }

    public void setLoanType(Short loanType) {
        this.loanType = loanType;
    }

    public Short getLoanState() {
        return loanState;
    }

    public void setLoanState(Short loanState) {
        this.loanState = loanState;
    }

    public String getLoanSum() {
        return loanSum;
    }

    public void setLoanSum(String loanSum) {
        this.loanSum = loanSum == null ? null : loanSum.trim();
    }

    public BigDecimal getLoanRate() {
        return loanRate;
    }

    public void setLoanRate(BigDecimal loanRate) {
        this.loanRate = loanRate;
    }

    public Short getLoanRepayment() {
        return loanRepayment;
    }

    public void setLoanRepayment(Short loanRepayment) {
        this.loanRepayment = loanRepayment;
    }

    public Date getLoanDate() {
        return loanDate;
    }

    public void setLoanDate(Date loanDate) {
        this.loanDate = loanDate;
    }

    public Integer getLoanPeriod() {
        return loanPeriod;
    }

    public void setLoanPeriod(Integer loanPeriod) {
        this.loanPeriod = loanPeriod;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getRepayName() {
        return repayName;
    }

    public void setRepayName(String repayName) {
        this.repayName = repayName;
    }
}