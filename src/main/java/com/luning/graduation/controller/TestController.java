package com.luning.graduation.controller;

import com.alibaba.fastjson.JSON;
import com.luning.graduation.pojo.bo.TestBo;
import com.luning.graduation.service.TestService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * @author ln
 * 用于测试的控制器
 */
@Controller
public class TestController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(TestController.class);

    @Autowired
    private TestService testService;

    @RequestMapping("/testJson")
    public void testJson(HttpServletRequest request,
                         HttpServletResponse response) throws Exception {
        logger.info("[TestController]req. " + request);
        List<TestBo> testBoList = new ArrayList<>();
        try {
            testBoList = testService.test();
        } catch (Exception e) {
            logger.error("[TestController] get id:", e);
        }
        write(response, JSON.toJSONString(testBoList));
    }

    @RequestMapping("/testJsonP")
    public void testJsonP(HttpServletRequest request,
                          HttpServletResponse response) throws Exception {
        logger.info("[TestController]req. " + request);
        List<TestBo> testBoList = new ArrayList<>();
        String callback = request.getParameter("JsonP");
        try {
            testBoList = testService.test();
        } catch (Exception e) {
            logger.error("[TestController] get id:", e);
        }
        writeJsonP(response, callback,
                JSON.toJSONString(testBoList));
    }
}
