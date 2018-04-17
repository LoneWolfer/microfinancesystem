package com.luning.graduation.dao;

import com.luning.graduation.entity.BusinessLoanBo;
import com.luning.graduation.entity.BusinessMoneyBo;
import com.luning.graduation.entity.CountApplyBo;

import java.util.List;
import java.util.Map;

/**
 * @author ln
 * 贷款申请数据操作DAO层
 */
public interface BusinessLoanDao {
    /**
     * 根据id查询单个贷款申请信息
     *
     * @param id 贷款申请id
     * @return BusinessLoanBo
     */
    BusinessLoanBo getLoan(Long id);

    /**
     * 查询所有贷款申请信息
     *
     * @return List
     */
    List<BusinessLoanBo> listLoan();

    /**
     * 插入单个贷款申请信息
     *
     * @param businessLoanBo 贷款申请对象
     * @return int 1:插入成功 0:插入失败
     */
    int insertLoan(BusinessLoanBo businessLoanBo);

    /**
     * 删除单个客户贷款申请信息
     *
     * @param id 贷款申请id
     * @return int 1:删除成功 0:删除失败
     */
    int deleteLoan(Long id);

    /**
     * 更新客户信息
     *
     * @param businessLoanBo 客户对象
     * @return int 1:更新成功 0:更新失败
     */
    int updateLoan(BusinessLoanBo businessLoanBo);

    /**
     * 统计所有贷款申请信息
     *
     * @return int 值为贷款申请信息数
     */
    int countLoan();

    /**
     * 查询所有未处理贷款申请信息
     *
     * @return List
     */
    List<BusinessLoanBo> listSchedule();

    /**
     * 通过贷款申请
     *
     * @param businessLoanBo 贷款申请
     * @return int
     */
    int passSchedule(BusinessLoanBo businessLoanBo);

    /**
     * 拒绝贷款申请
     *
     * @param businessLoanBo 贷款申请
     * @return int
     */
    int refuseSchedule(BusinessLoanBo businessLoanBo);

    /**
     * 查询所有已处理的贷款申请信息
     *
     * @return list
     */
    List<BusinessLoanBo> listDone();

    /**
     * 根据条件查询查询
     *
     * @param searchMap 查询条件
     * @return list
     */
    List<BusinessLoanBo> listSearch(Map<String, Object> searchMap);

    /**
     * 按日统计贷款申请
     *
     * @return list
     */
    List<CountApplyBo> countByDay();
}