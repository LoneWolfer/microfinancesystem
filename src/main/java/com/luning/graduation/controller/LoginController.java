package com.luning.graduation.controller;

import com.luning.graduation.PageCodeEnum;
import com.luning.graduation.util.SessionKeyConst;
import com.luning.graduation.entity.SystemUserBo;
import com.luning.graduation.service.SystemUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author ln
 * 处理登陆请求的控制器
 */
@Controller
@RequestMapping("/login")
public class LoginController extends BaseController {

    @Autowired
    private SystemUserService systemUserService;

    /**
     * 登录页面
     */
    @RequestMapping
    public String login() {
        return "admin/login";
    }

    /**
     * session超时，重新登陆
     */
    @RequestMapping("/sessionTimeout")
    public String sessionTimeout(RedirectAttributes attr) {
        attr.addFlashAttribute(PageCodeEnum.KEY, PageCodeEnum.SESSION_TIMEOUT);
        return "redirect:/login";
    }

    /**
     * 验证用户名/密码是否正确 验证通过,跳转至首页;验证失败，返回至登录页。
     */
    @RequestMapping("/validate")
    public String validate(HttpServletRequest request,
                           RedirectAttributes attr, HttpSession session) {
        //获取用户名、密码参数
        String name = request.getParameter("account");
        String password = request.getParameter("password");
        //封装用户对象
        SystemUserBo systemUserBo = new SystemUserBo();
        systemUserBo.setUserName(name);
        systemUserBo.setPassword(password);
        //用户名密码验证
        if (systemUserService.validate(systemUserBo)) {
            SystemUserBo user = systemUserService.getByName(name);
            session.setAttribute(SessionKeyConst.USER_INFO, user);
            //账号启用状态
            if (user.getStatus() == 1) {
                return "redirect:/admin";
            } else {
                attr.addFlashAttribute(PageCodeEnum.KEY, PageCodeEnum.LOGIN_FORBID);
                return "redirect:/login";
            }
        }
        attr.addFlashAttribute(PageCodeEnum.KEY, PageCodeEnum.LOGIN_FAIL);
        return "redirect:/login";
    }
}
