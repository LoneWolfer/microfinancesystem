package com.luning.graduation.controller.manage;

import com.alibaba.fastjson.JSON;
import com.luning.graduation.LoanRepayEnum;
import com.luning.graduation.LoanTypeEnum;
import com.luning.graduation.controller.BaseController;
import com.luning.graduation.entity.*;
import com.luning.graduation.service.BusinessCustomerService;
import com.luning.graduation.service.BusinessLoanService;
import com.luning.graduation.service.BusinessRateService;
import com.luning.graduation.util.CommonUtil;
import com.luning.graduation.util.SessionKeyConst;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author ln
 * 业务管理模块控制器
 */
@Controller
@RequestMapping("/business")
public class BusinessController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(BusinessController.class);

    @Autowired
    private BusinessLoanService businessLoanService;
    @Autowired
    private BusinessCustomerService businessCustomerService;
    @Autowired
    private BusinessRateService businessRateService;

    @RequestMapping("/application/list")
    public void listApplication(HttpServletRequest request,
                                HttpServletResponse response,
                                @RequestParam(value = "key", required = false) String key) throws Exception {
        logger.info("[BusinessController]req. " + request);
        Map<String, Object> businessMap = new HashMap<>(4);
        try {
            List<BusinessLoanBo> businessLoanBoList = new ArrayList<>();
            if (key != null && !"".equals(key)) {
                BusinessLoanBo businessLoanBo = businessLoanService.getLoan(Long.valueOf(key));
                businessLoanBoList.add(businessLoanBo);
            } else {
                businessLoanBoList = businessLoanService.listLoan();
            }
            int count = businessLoanService.countLoan();
            //封装数据接口
            businessMap.put("code", 0);
            businessMap.put("msg", "");
            businessMap.put("count", count);
            businessMap.put("data", businessLoanBoList);
        } catch (Exception e) {
            logger.error("[BusinessController] get id:", e);
        }
        write(response, JSON.toJSONString(businessMap));
    }

    @RequestMapping("/application/insert")
    @ResponseBody
    public String insertApplication(BusinessLoanBo businessLoanBo) {
        businessLoanBo.setGmtCreate(new Date());
        businessLoanBo.setGmtModified(new Date());
        businessLoanBo.setLoanDate(new Date());
        BusinessCustomerBo businessCustomerBo = businessCustomerService.getCustomer(businessLoanBo.getCustomerId());
        Integer credit = businessCustomerBo.getCustomerCredit();
        List<BusinessRateBo> businessRateBoList = businessRateService.listRate();
        final Long[] limit = {null};
        businessRateBoList.forEach((BusinessRateBo businessRateBo) -> {
            String[] arr = businessRateBo.getCreditRange().split(",");
            if (credit >= Integer.parseInt(arr[0]) && credit <= Integer.parseInt(arr[1])) {
                businessLoanBo.setLoanRate(businessRateBo.getLoanRate());
                limit[0] = businessRateBo.getLoanLimit();
            }
        });
        if (businessLoanBo.getLoanSum() > limit[0]) {
            return "overLimit";
        } else {
            if (businessLoanService.insertLoan(businessLoanBo) == 1) {
                return "success";
            } else {
                return "error";
            }
        }
    }

    @RequestMapping("/application/search")
    public void searchApplication(HttpServletRequest request,
                                  HttpServletResponse response,
                                  @RequestParam(value = "name", required = false) String name,
                                  @RequestParam(value = "date", required = false) String date,
                                  @RequestParam(value = "type", required = false) String type,
                                  @RequestParam(value = "state", required = false) String state) throws Exception {
        logger.info("[BusinessController]req. " + request);
        Map<String, Object> businessMap = new HashMap<>(4);
        try {
            List<BusinessLoanBo> businessLoanBoList;
            if (!CommonUtil.isEmpty(name) || !CommonUtil.isEmpty(date)
                    || !CommonUtil.isEmpty(type) || !CommonUtil.isEmpty(state)) {
                Map<String, Object> searchMap = new HashMap<>(4);
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                if (!CommonUtil.isEmpty(date)) {
                    Date d = dateFormat.parse(date);
                    searchMap.put("loanDate", d);
                }
                if (!CommonUtil.isEmpty(name)) {
                    Long id = businessCustomerService.getByName(name).getId();
                    searchMap.put("customerId", id);
                }
                if (!CommonUtil.isEmpty(type)) {
                    searchMap.put("loanType", Integer.valueOf(type));
                }
                if (!CommonUtil.isEmpty(state)) {
                    searchMap.put("loanState", Integer.valueOf(state));
                }
                businessLoanBoList = businessLoanService.listSearch(searchMap);
            } else {
                businessLoanBoList = businessLoanService.listLoan();
            }
            int count = businessLoanBoList.size();
            //封装数据接口
            businessMap.put("code", 0);
            businessMap.put("msg", "");
            businessMap.put("count", count);
            businessMap.put("data", businessLoanBoList);
        } catch (Exception e) {
            logger.error("[BusinessController] get id:", e);
        }
        write(response, JSON.toJSONString(businessMap));
    }

    @RequestMapping("/schedule/list")
    public void listSchedule(HttpServletRequest request,
                             HttpServletResponse response,
                             @RequestParam(value = "key", required = false) String key) throws Exception {
        logger.info("[BusinessController]req. " + request);
        Map<String, Object> businessMap = new HashMap<>(4);
        try {
            List<BusinessLoanBo> businessLoanBoList = new ArrayList<>();
            if (key != null && !"".equals(key)) {
                BusinessLoanBo businessLoanBo = businessLoanService.getLoan(Long.valueOf(key));
                businessLoanBoList.add(businessLoanBo);
            } else {
                businessLoanBoList = businessLoanService.listSchedule();
            }
            int count = businessLoanService.countLoan();
            //封装数据接口
            businessMap.put("code", 0);
            businessMap.put("msg", "");
            businessMap.put("count", count);
            businessMap.put("data", businessLoanBoList);
        } catch (Exception e) {
            logger.error("[BusinessController] get id:", e);
        }
        write(response, JSON.toJSONString(businessMap));
    }

    @RequestMapping("/schedule/pass")
    @ResponseBody
    public String passSchedule(@RequestParam("id") String id, HttpSession session) {
        SystemUserBo systemUserBo = (SystemUserBo) session.getAttribute(SessionKeyConst.USER_INFO);
        BusinessLoanBo businessLoanBo = new BusinessLoanBo();
        businessLoanBo.setId(Long.valueOf(id));
        businessLoanBo.setUserId(systemUserBo.getId());
        if (businessLoanService.passSchedule(businessLoanBo) == 1) {
            Long loanSum = businessLoanService.getLoan(Long.valueOf(id)).getLoanSum();
            if (businessLoanService.updateMoney(loanSum) == -1){
                return "LackOfMoney";
            }else {
                return "success";
            }
        } else {
            return "error";
        }
    }

    @RequestMapping("/schedule/refuse")
    @ResponseBody
    public String refuseSchedule(@RequestParam("id") String id, HttpSession session) {
        SystemUserBo systemUserBo = (SystemUserBo) session.getAttribute(SessionKeyConst.USER_INFO);
        BusinessLoanBo businessLoanBo = new BusinessLoanBo();
        businessLoanBo.setId(Long.valueOf(id));
        businessLoanBo.setUserId(systemUserBo.getId());
        if (businessLoanService.refuseSchedule(businessLoanBo) == 1) {
            return "success";
        } else {
            return "error";
        }
    }

    @RequestMapping("/done/list")
    public void listDone(HttpServletRequest request,
                         HttpServletResponse response,
                         @RequestParam(value = "key", required = false) String key) throws Exception {
        logger.info("[BusinessController]req. " + request);
        Map<String, Object> businessMap = new HashMap<>(4);
        try {
            List<BusinessLoanBo> businessLoanBoList = new ArrayList<>();
            if (key != null && !"".equals(key)) {
                BusinessLoanBo businessLoanBo = businessLoanService.getLoan(Long.valueOf(key));
                businessLoanBoList.add(businessLoanBo);
            } else {
                businessLoanBoList = businessLoanService.listDone();
            }
            int count = businessLoanService.countLoan();
            //封装数据接口
            businessMap.put("code", 0);
            businessMap.put("msg", "");
            businessMap.put("count", count);
            businessMap.put("data", businessLoanBoList);
        } catch (Exception e) {
            logger.error("[BusinessController] get id:", e);
        }
        write(response, JSON.toJSONString(businessMap));
    }

    @RequestMapping("/enum/type")
    public void listType(HttpServletRequest request,
                         HttpServletResponse response) throws Exception {
        logger.info("[BusinessController]req. " + request);
        List<Map> enumList = new ArrayList<>();
        try {
            for (LoanTypeEnum loanTypeEnum : LoanTypeEnum.values()
                    ) {
                enumList.add(loanTypeEnum.toMap());
            }
        } catch (Exception e) {
            logger.error("[BusinessController] get id:", e);
        }
        write(response, JSON.toJSONString(enumList));
    }

    @RequestMapping("/enum/repay")
    public void listRepay(HttpServletRequest request,
                          HttpServletResponse response) throws Exception {
        logger.info("[BusinessController]req. " + request);
        List<Map> enumList = new ArrayList<>();
        try {
            for (LoanRepayEnum loanRepayEnum : LoanRepayEnum.values()
                    ) {
                enumList.add(loanRepayEnum.toMap());
            }
        } catch (Exception e) {
            logger.error("[BusinessController] get id:", e);
        }
        write(response, JSON.toJSONString(enumList));
    }

    @RequestMapping("/money/get")
    public void getMoney(HttpServletRequest request,
                          HttpServletResponse response) throws Exception {
        logger.info("[BusinessController]req. " + request);
        BusinessMoneyBo businessMoneyBo = new BusinessMoneyBo();
        try {
            businessMoneyBo = businessLoanService.getMoney(1L);
        } catch (Exception e) {
            logger.error("[BusinessController] get id:", e);
        }
        write(response, JSON.toJSONString(businessMoneyBo));
    }
}
