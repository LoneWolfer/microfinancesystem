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
            if (systemMrBo.getStatus() == 1) {
                systemMenuBoList.add(systemMenuDao.getSystemMenu(systemMrBo.getMenuId()));
            }
        });
        return systemMenuBoList;
    }

    @Override
    public List<SystemRoleBo> listRole() {
        return systemRoleDao.listRole();
    }

    @Override
    public int deleteRole(Long id) {
        return systemRoleDao.deleteRole(id);
    }

    @Override
    public int updateRole(SystemRoleBo systemRoleBo) {
        return systemRoleDao.updateRole(systemRoleBo);
    }

    @Override
    public int insertRole(SystemRoleBo systemRoleBo) {
        return systemRoleDao.insertRole(systemRoleBo);
    }

    @Override
    public SystemRoleBo getRole(Long id) {
        return systemRoleDao.getRole(id);
    }

    @Override
    public boolean updateMrBatch(Long rId, Long[] menuIds) {
        int result = 0;
        for (Long menuId : menuIds) {
            SystemMrBo systemMrBo = new SystemMrBo();
            Long mId = systemMenuDao.getMenuByMenuId(menuId).getId();
            systemMrBo.setRoleId(rId);
            systemMrBo.setMenuId(mId);
            result = systemMrDao.updateSystemMr(systemMrBo);
        }
        return result == 1;
    }

    @Override
    public int clearMr(Long roleId) {
        return systemMrDao.clearMr(roleId);
    }

    @Override
    public int insertUr(SystemUrBo systemUrBo) {
        return systemUrDao.insertUr(systemUrBo);
    }

    @Override
    public int updateUr(SystemUrBo systemUrBo) {
        return systemUrDao.updateUr(systemUrBo);
    }

    @Override
    public int insertMr(SystemMrBo systemMrBo) {
        return systemMrDao.insertMr(systemMrBo);
    }

    @Override
    public SystemRoleBo getRoleByName(String roleName) {
        return systemRoleDao.getRoleByName(roleName);
    }
}
