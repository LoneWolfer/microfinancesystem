package com.luning.graduation.entity;

import java.util.Date;

public class BusinessProvideBo {
    private Long id;

    private Date gmtCreate;

    private Date gmtModified;

    private Long loanId;

    private Long userId;

    private String provideSum;

    private Date provideDate;

    private Date provideLast;

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

    public Long getLoanId() {
        return loanId;
    }

    public void setLoanId(Long loanId) {
        this.loanId = loanId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getProvideSum() {
        return provideSum;
    }

    public void setProvideSum(String provideSum) {
        this.provideSum = provideSum == null ? null : provideSum.trim();
    }

    public Date getProvideDate() {
        return provideDate;
    }

    public void setProvideDate(Date provideDate) {
        this.provideDate = provideDate;
    }

    public Date getProvideLast() {
        return provideLast;
    }

    public void setProvideLast(Date provideLast) {
        this.provideLast = provideLast;
    }
}