package com.luning.graduation.service.impl;

import com.luning.graduation.dao.SystemMenuDao;
import com.luning.graduation.dao.SystemMrDao;
import com.luning.graduation.dao.SystemRoleDao;
import com.luning.graduation.dao.SystemUrDao;
import com.luning.graduation.entity.SystemMenuBo;
import com.luning.graduation.entity.SystemMrBo;
import com.luning.graduation.entity.SystemRoleBo;
import com.luning.graduation.entity.SystemUrBo;
import com.luning.graduation.service.AuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author ln
 * 权限管理的Service层接口实现类
 */
@Service
public class AuthorityServiceImpl implements AuthorityService {

    @Autowired
    private SystemMenuDao systemMenuDao;
    @Autowired
    private SystemRoleDao systemRoleDao;
    @Autowired
    private SystemUrDao systemUrDao;
    @Autowired
    protected SystemMrDao systemMrDao;


    @Override
    public List<SystemMenuBo> listMenuByUserId(Long userId) {
        List<SystemMenuBo> systemMenuBoList = new ArrayList<>();
        SystemUrBo systemUrBo = systemUrDao.getSystemUr(userId);
        List<SystemMrBo> systemMrBoList = systemMrDao.listSystemMr(systemUrBo.getRoleId());
        systemMrBoList.forEach(systemMrBo -> {
            systemMenuBoList.add(systemMenuDao.getSystemMenu(systemMrBo.getMenuId()));
        });
        return systemMenuBoList;
    }
}
