package com.luning.graduation.controller.manage;

import com.alibaba.fastjson.JSON;
import com.luning.graduation.controller.BaseController;
import com.luning.graduation.entity.BusinessRateBo;
import com.luning.graduation.service.BusinessRateService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author ln
 * 利率管理控制器
 */
@Controller
@RequestMapping("/rate")
public class RateController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(RateController.class);

    @Autowired
    private BusinessRateService businessRateService;

    @RequestMapping("/rate/list")
    public void listRate(HttpServletRequest request,
                         HttpServletResponse response) throws Exception {
        logger.info("[RateController]req. " + request);
        Map<String, Object> rateMap = new HashMap<>(4);
        try {
            int count = businessRateService.countRate();
            List<BusinessRateBo> businessRateBoList = businessRateService.listRate();
            //封装数据接口
            rateMap.put("code", 0);
            rateMap.put("msg", "");
            rateMap.put("count", count);
            rateMap.put("data", businessRateBoList);
        }catch (Exception e){
            logger.error("[RateController] get id:", e);
        }
        write(response, JSON.toJSONString(rateMap));
    }

    @RequestMapping("/rate/insert")
    @ResponseBody
    public String insertRate(BusinessRateBo businessRateBo){
        businessRateBo.setGmtCreate(new Date());
        businessRateBo.setGmtModified(new Date());
        if (businessRateService.insertRate(businessRateBo) == 1){
            return "success";
        }else {
            return "error";
        }
    }

    @RequestMapping("/rate/update")
    @ResponseBody
    public String updateRate(BusinessRateBo businessRateBo){
        if (businessRateService.updateRate(businessRateBo) == 1){
            return "success";
        }else {
            return "error";
        }
    }

    @RequestMapping("/rate/delete")
    @ResponseBody
    public String deleteRate(@RequestParam("id") String id){
        if (businessRateService.deleteRate(Long.valueOf(id)) == 1){
            return "success";
        }else {
            return "error";
        }
    }
}
