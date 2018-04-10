package com.luning.graduation.controller.manage;

import com.alibaba.fastjson.JSON;
import com.luning.graduation.controller.BaseController;
import com.luning.graduation.entity.BusinessCustomerBo;
import com.luning.graduation.service.BusinessCustomerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * @author ln
 * 客户管理模块控制器
 */
@Controller
@RequestMapping("/customer")
public class CustomerController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(CustomerController.class);

    @Autowired
    private BusinessCustomerService businessCustomerService;

    @RequestMapping("/custom/list")
    public void listCustom(HttpServletRequest request,
                           HttpServletResponse response,
                           @RequestParam(value = "key", required = false) String key) throws Exception {
        logger.info("[CustomerController]req. " + request);
        Map<String, Object> customerMap = new HashMap<>(4);
        try {
            int count = businessCustomerService.countCustomer();
            List<BusinessCustomerBo> customerBoList = businessCustomerService.listCustomer();
            List<BusinessCustomerBo> customerBos = new ArrayList<>();

            //封装数据接口
            customerMap.put("code", 0);
            customerMap.put("msg", "");
            customerMap.put("count", count);
            if (key != null && !"".equals(key)) {
                BusinessCustomerBo businessCustomerBo = businessCustomerService.getByName(key);
                if (businessCustomerBo != null) {
                    customerBos.add(businessCustomerBo);
                }
                customerMap.put("data", customerBos);
            } else {
                customerMap.put("data", customerBoList);
            }
        } catch (Exception e) {
            logger.error("[CustomerController] get id:", e);
        }
        write(response, JSON.toJSONString(customerMap));
    }

    @RequestMapping("/custom/forbid")
    @ResponseBody
    public String forbidCustom(@RequestParam("id") Long id) {
        if (businessCustomerService.forbidCustomer(id) == 1) {
            return "success";
        } else {
            return "error";
        }
    }

    @RequestMapping("/custom/update")
    @ResponseBody
    public String updateCustom(BusinessCustomerBo businessCustomerBo) {
        if (businessCustomerService.updateCustomer(businessCustomerBo) == 1) {
            return "success";
        } else {
            return "error";
        }
    }

    @RequestMapping("/custom/insert")
    @ResponseBody
    public String insertCustom(BusinessCustomerBo businessCustomerBo) {
        businessCustomerBo.setGmtCreate(new Date());
        businessCustomerBo.setGmtModified(new Date());
        if (businessCustomerService.insertCustomer(businessCustomerBo) == 1) {
            return "success";
        } else {
            return "error";
        }
    }

    @RequestMapping("/black/list")
    public void listBlack(HttpServletRequest request,
                          HttpServletResponse response,
                          @RequestParam(value = "key", required = false) String key) throws Exception {
        logger.info("[CustomerController]req. " + request);
        Map<String, Object> customerMap = new HashMap<>(4);
        try {
            int count = businessCustomerService.countCustomer();
            List<BusinessCustomerBo> customerBoList = businessCustomerService.listBlack();
            List<BusinessCustomerBo> customerBos = new ArrayList<>();

            //封装数据接口
            customerMap.put("code", 0);
            customerMap.put("msg", "");
            customerMap.put("count", count);
            if (key != null && !"".equals(key)) {
                BusinessCustomerBo businessCustomerBo = businessCustomerService.getByBlackName(key);
                if (businessCustomerBo != null) {
                    customerBos.add(businessCustomerBo);
                }
                customerMap.put("data", customerBos);
            } else {
                customerMap.put("data", customerBoList);
            }
        } catch (Exception e) {
            logger.error("[CustomerController] get id:", e);
        }
        write(response, JSON.toJSONString(customerMap));
    }

    @RequestMapping("/black/update")
    @ResponseBody
    public String updateBlack(@RequestParam("id") Long id) {
        if (businessCustomerService.updateBlack(id) == 1) {
            return "success";
        } else {
            return "error";
        }
    }
}
