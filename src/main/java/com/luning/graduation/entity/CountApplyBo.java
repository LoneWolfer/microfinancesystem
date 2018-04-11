package com.luning.graduation.entity;

import java.util.Date;

public class CountApplyBo {
    private Long id;

    private Date gmtCreate;

    private Date gmtModified;

    private Integer applySum;

    private Integer applyPassed;

    private Long applyAmount;

    private Long applyProvide;

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

    public Integer getApplySum() {
        return applySum;
    }

    public void setApplySum(Integer applySum) {
        this.applySum = applySum;
    }

    public Integer getApplyPassed() {
        return applyPassed;
    }

    public void setApplyPassed(Integer applyPassed) {
        this.applyPassed = applyPassed;
    }

    public Long getApplyAmount() {
        return applyAmount;
    }

    public void setApplyAmount(Long applyAmount) {
        this.applyAmount = applyAmount;
    }

    public Long getApplyProvide() {
        return applyProvide;
    }

    public void setApplyProvide(Long applyProvide) {
        this.applyProvide = applyProvide;
    }
}