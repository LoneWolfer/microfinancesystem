package com.luning.graduation.controller.manage;

import com.alibaba.fastjson.JSON;
import com.luning.graduation.controller.BaseController;
import com.luning.graduation.entity.*;
import com.luning.graduation.entity.vo.NavSonVo;
import com.luning.graduation.entity.vo.NavVo;
import com.luning.graduation.service.AuthorityService;
import com.luning.graduation.service.SystemUserService;
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
    @Autowired
    private AuthorityService authorityService;

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
    public String updateUser(SystemUserBo systemUserBo) {
        if (systemUserService.updateSystemUser(systemUserBo) == 1) {
            return "success";
        } else {
            return "error";
        }
    }

    @RequestMapping("/account/update")
    @ResponseBody
    public String updateAccount(SystemUserBo systemUserBo,HttpSession session) {
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
        String userName = systemUserBo.getUserName();
        if (systemUserService.listByName(userName).size() == 0) {
            if (systemUserService.insertSystemUser(systemUserBo) == 1) {
                Long uId = systemUserService.getByName(userName).getId();
                SystemUrBo systemUrBo = new SystemUrBo();
                systemUrBo.setGmtCreate(new Date());
                systemUrBo.setGmtModified(new Date());
                systemUrBo.setRoleId(3L);
                systemUrBo.setUserId(uId);
                authorityService.insertUr(systemUrBo);
                return "success";
            } else {
                return "error";
            }
        } else {
            return "errorName";
        }
    }

    @RequestMapping("/auth/list")
    public void listAuth(HttpServletRequest request,
                         HttpServletResponse response, HttpSession session) throws Exception {
        logger.info("[SystemController]req. " + request);
        Map<String, List<NavVo>> map = new HashMap<>(1);
        try {
            List<NavVo> navVoList = new ArrayList<>();
            SystemUserBo user = (SystemUserBo) session.getAttribute(SessionKeyConst.USER_INFO);
            Long userId = user.getId();
            List<SystemMenuBo> systemMenuBoList = authorityService.listMenuByUserId(userId);
            systemMenuBoList.forEach(systemMenuBo -> {
                NavVo navVo = new NavVo();
                if (systemMenuBo.getParentId() == 0) {
                    List<NavSonVo> navSonVoList = new ArrayList<>();
                    for (SystemMenuBo menuBo : systemMenuBoList) {
                        if (menuBo.getParentId().equals(systemMenuBo.getMenuId())) {
                            NavSonVo navSonVo = new NavSonVo();
                            navSonVo.setText(menuBo.getMenuName());
                            navSonVo.setIcon(menuBo.getMenuIcon());
                            navSonVo.setHref(menuBo.getMenuUrl());
                            navSonVoList.add(navSonVo);
                        }
                    }
                    navVo.setText(systemMenuBo.getMenuName());
                    navVo.setIcon(systemMenuBo.getMenuIcon());
                    navVo.setSubset(navSonVoList);
                    navVoList.add(navVo);
                }
            });
            map.put("data", navVoList);
        } catch (Exception e) {
            logger.error("[SystemController] get id:", e);
        }
        write(response, JSON.toJSONString(map));
    }

    @RequestMapping("/menu/list")
    public void listMenu(HttpServletRequest request,
                         HttpServletResponse response, HttpSession session) throws Exception {
        logger.info("[SystemController]req. " + request);
        List<SystemMenuBo> systemMenuBoList = new ArrayList<>();
        try {
            SystemUserBo user = (SystemUserBo) session.getAttribute(SessionKeyConst.USER_INFO);
            Long userId = user.getId();
            systemMenuBoList = authorityService.listMenuByUserId(userId);
        } catch (Exception e) {
            logger.error("[SystemController] get id:", e);
        }
        write(response, JSON.toJSONString(systemMenuBoList));
    }

    @RequestMapping("/role/list")
    public void listRole(HttpServletRequest request,
                         HttpServletResponse response,
                         @RequestParam(value = "key", required = false) String id) throws Exception {
        logger.info("[SystemController]req. " + request);
        Map<String, Object> map = new HashMap<>(4);
        try {
            List<SystemRoleBo> systemRoleBoList = new ArrayList<>();
            map.put("code", 0);
            map.put("msg", "");
            if (!CommonUtil.isEmpty(id)) {
                SystemRoleBo systemRoleBo = authorityService.getRole(Long.valueOf(id));
                systemRoleBoList.add(systemRoleBo);
                map.put("count", 1);
            } else {
                systemRoleBoList = authorityService.listRole();
                int count = systemRoleBoList.size();
                map.put("count", count);
            }
            map.put("data", systemRoleBoList);
        } catch (Exception e) {
            logger.error("[SystemController] get id:", e);
        }
        write(response, JSON.toJSONString(map));
    }

    @RequestMapping("/role/delete")
    @ResponseBody
    public String deleteRole(@RequestParam("id") String id) {
        if (authorityService.deleteRole(Long.valueOf(id)) == 1) {
            return "success";
        } else {
            return "error";
        }
    }

    @RequestMapping("/role/update")
    @ResponseBody
    public String updateRole(SystemRoleBo systemRoleBo) {
        if (authorityService.updateRole(systemRoleBo) == 1) {
            return "success";
        } else {
            return "error";
        }
    }

    @RequestMapping("/role/insert")
    @ResponseBody
    public String insertRole(SystemRoleBo systemRoleBo) {
        systemRoleBo.setGmtCreate(new Date());
        systemRoleBo.setGmtModified(new Date());
        if (authorityService.insertRole(systemRoleBo) == 1) {
            Long roleId = authorityService.getRoleByName(systemRoleBo.getRoleName()).getId();
            SystemMrBo systemMrBo = new SystemMrBo();
            for (int i = 1; i < 20; i ++){
                systemMrBo.setGmtCreate(new Date());
                systemMrBo.setGmtModified(new Date());
                systemMrBo.setRoleId(roleId);
                systemMrBo.setMenuId((long) i);
                systemMrBo.setStatus(0);
                authorityService.insertMr(systemMrBo);
            }
            return "success";
        } else {
            return "error";
        }
    }

    @RequestMapping("/mr/update")
    @ResponseBody
    public String updateMr(Long[] menuIds,
                           @RequestParam("roleId") String roleId) {
        Long rId = Long.valueOf(roleId);
        if (authorityService.updateMrBatch(rId, menuIds)) {
            return "success";
        } else {
            return "error";
        }
    }

    @RequestMapping("/mr/clear")
    @ResponseBody
    public String clearMr(Long roleId) {
        if (authorityService.clearMr(roleId) >= 1) {
            return "success";
        } else {
            return "error";
        }
    }

    @RequestMapping("/ur/update")
    @ResponseBody
    public String updateUr(SystemUrBo systemUrBo){
        if (authorityService.updateUr(systemUrBo) == 1){
            return "success";
        }else {
            return "error";
        }
    }
}
