package com.luning.graduation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author ln
 * iframe页面跳转url的控制器
 */
@Controller
public class PathController {

    @RequestMapping("/admin")
    public String admin() {
        return "admin/admin";
    }

    @RequestMapping("/welcome")
    public String welcome() {
        return "admin/welcome";
    }

    @RequestMapping("/application")
    public String application() {
        return "business/application";
    }

    @RequestMapping("/done")
    public String done() {
        return "business/done";
    }

    @RequestMapping("/schedule")
    public String schedule() {
        return "business/schedule";
    }

    @RequestMapping("/urge")
    public String urge() {
        return "after/urge";
    }

    @RequestMapping("/break")
    public String breakLoan() {
        return "after/break";
    }

    @RequestMapping("/rate")
    public String rate() {
        return "rate/rate";
    }

    @RequestMapping("/search")
    public String search() {
        return "analysis/search";
    }

    @RequestMapping("/analyse")
    public String analyse() {
        return "analysis/analyse";
    }

    @RequestMapping("/customer")
    public String customer() {
        return "customer/customer";
    }

    @RequestMapping("/blacklist")
    public String blacklist() {
        return "customer/blacklist";
    }

    @RequestMapping("/account")
    public String account() {
        return "system/account";
    }

    @RequestMapping("/user")
    public String user() {
        return "system/user";
    }

    @RequestMapping("/authority")
    public String authority() {
        return "system/authority";
    }
}
