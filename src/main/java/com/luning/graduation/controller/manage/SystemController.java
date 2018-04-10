package com.luning.graduation.controller.manage;

import com.alibaba.fastjson.JSON;
import com.luning.graduation.controller.BaseController;
import com.luning.graduation.entity.SystemUserBo;
import com.luning.graduation.service.SystemUserService;
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
import java.util.*;

/**
 * @author ln
 * 系统管理模块控制器
 */
@Controller
@RequestMapping("/system")
public class SystemController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(SystemController.class);

    @Autowired
    private SystemUserService systemUserService;

    @RequestMapping("/user/list")
    public void listUser(HttpServletRequest request,
                         HttpServletResponse response,
                         @RequestParam(value = "key", required = false) String key) throws Exception {
        logger.info("[SystemController]req. " + request);
        Map<String, Object> systemUserMap = new HashMap<>(4);
        try {
            int count = systemUserService.countSystemUser();
            List<SystemUserBo> systemUserBoList = systemUserService.listSystemUser();
            List<SystemUserBo> systemUserBos = new ArrayList<>();

            //封装数据接口
            systemUserMap.put("code", 0);
            systemUserMap.put("msg", "");
            systemUserMap.put("count", count);
            if (key != null && !"".equals(key)) {
                SystemUserBo systemUserBo = systemUserService.getSystemUser(Long.parseLong(key));
                if (systemUserBo != null) {
                    systemUserBos.add(systemUserBo);
                }
                systemUserMap.put("data", systemUserBos);
            } else {
                systemUserMap.put("data", systemUserBoList);
            }
        } catch (Exception e) {
            logger.error("[SystemController] get id:", e);
        }
        write(response, JSON.toJSONString(systemUserMap));
    }

    @RequestMapping("/user/forbid")
    @ResponseBody
    public String forbidUser(SystemUserBo systemUserBo) {
        if (systemUserService.updateSystemUser(systemUserBo) == 1) {
            return "success";
        } else {
            return "error";
        }
    }

    @RequestMapping("/user/update")
    @ResponseBody
    public String updateUser(SystemUserBo systemUserBo, HttpSession session) {
        if (systemUserService.updateSystemUser(systemUserBo) == 1) {
            SystemUserBo user = systemUserService.getSystemUser(systemUserBo.getId());
            session.setAttribute(SessionKeyConst.USER_INFO, user);
            return "success";
        } else {
            return "error";
        }
    }

    @RequestMapping("/user/insert")
    @ResponseBody
    public String insertUser(SystemUserBo systemUserBo) {
        systemUserBo.setGmtCreate(new Date());
        systemUserBo.setGmtModified(new Date());
        if (systemUserService.insertSystemUser(systemUserBo) == 1) {
            return "success";
        } else {
            return "error";
        }
    }
}
