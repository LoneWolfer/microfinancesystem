package com.luning.graduation.controller;

import com.luning.graduation.model.bo.TestBo;
import com.luning.graduation.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class TestController {

    @Autowired
    private TestService testService;

    @RequestMapping("/test")
    public ModelAndView test(){
        List<TestBo> testBoList = new ArrayList<>(testService.test());
        ModelAndView modelAndView = new ModelAndView("test");
        modelAndView.addObject("testBoList",testBoList);
        return modelAndView;
    }
}
