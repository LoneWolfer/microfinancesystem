package com.luning.graduation.entity;

import java.math.BigDecimal;
import java.util.Date;

public class BusinessRateBo {
    private Long id;

    private Date gmtCreate;

    private Date gmtModified;

    private String creditRange;

    private BigDecimal loanRate;

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

    public String getCreditRange() {
        return creditRange;
    }

    public void setCreditRange(String creditRange) {
        this.creditRange = creditRange;
    }

    public BigDecimal getLoanRate() {
        return loanRate;
    }

    public void setLoanRate(BigDecimal loanRate) {
        this.loanRate = loanRate;
    }
}