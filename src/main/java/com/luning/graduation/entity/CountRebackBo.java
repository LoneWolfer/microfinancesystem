package com.luning.graduation.entity;

import java.util.Date;

public class CountRebackBo {
    private Long id;

    private Date gmtCreate;

    private Date gmtModified;

    private Long rebackAmount;

    private Long nobackAmount;

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

    public Long getRebackAmount() {
        return rebackAmount;
    }

    public void setRebackAmount(Long rebackAmount) {
        this.rebackAmount = rebackAmount;
    }

    public Long getNobackAmount() {
        return nobackAmount;
    }

    public void setNobackAmount(Long nobackAmount) {
        this.nobackAmount = nobackAmount;
    }
}