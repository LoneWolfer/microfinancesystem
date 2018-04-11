package com.luning.graduation.entity;

import java.math.BigDecimal;
import java.util.Date;

public class BusinessCustomerBo {
    private Long id;

    private Date gmtCreate;

    private Date gmtModified;

    private String customerName;

    private Short customerSex;

    private String customerIdcard;

    private String customerEmail;

    private String customerPhone;

    private String customerAddress;

    private Integer customerCredit;

    private String customerCreditcard;

    private BigDecimal customerSalary;

    private String customerCompany;

    private String companyAddress;

    private String companyPhone;

    private Integer blackList;

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

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName == null ? null : customerName.trim();
    }

    public Short getCustomerSex() {
        return customerSex;
    }

    public void setCustomerSex(Short customerSex) {
        this.customerSex = customerSex;
    }

    public String getCustomerIdcard() {
        return customerIdcard;
    }

    public void setCustomerIdcard(String customerIdcard) {
        this.customerIdcard = customerIdcard == null ? null : customerIdcard.trim();
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail == null ? null : customerEmail.trim();
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone == null ? null : customerPhone.trim();
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress == null ? null : customerAddress.trim();
    }

    public Integer getCustomerCredit() {
        return customerCredit;
    }

    public void setCustomerCredit(Integer customerCredit) {
        this.customerCredit = customerCredit;
    }

    public String getCustomerCreditcard() {
        return customerCreditcard;
    }

    public void setCustomerCreditcard(String customerCreditcard) {
        this.customerCreditcard = customerCreditcard == null ? null : customerCreditcard.trim();
    }

    public BigDecimal getCustomerSalary() {
        return customerSalary;
    }

    public void setCustomerSalary(BigDecimal customerSalary) {
        this.customerSalary = customerSalary;
    }

    public String getCustomerCompany() {
        return customerCompany;
    }

    public void setCustomerCompany(String customerCompany) {
        this.customerCompany = customerCompany == null ? null : customerCompany.trim();
    }

    public String getCompanyAddress() {
        return companyAddress;
    }

    public void setCompanyAddress(String companyAddress) {
        this.companyAddress = companyAddress == null ? null : companyAddress.trim();
    }

    public String getCompanyPhone() {
        return companyPhone;
    }

    public void setCompanyPhone(String companyPhone) {
        this.companyPhone = companyPhone == null ? null : companyPhone.trim();
    }

    public Integer getBlackList() {
        return blackList;
    }

    public void setBlackList(Integer blackList) {
        this.blackList = blackList;
    }
}