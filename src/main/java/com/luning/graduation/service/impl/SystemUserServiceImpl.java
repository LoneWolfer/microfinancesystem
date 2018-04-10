package com.luning.graduation.service.impl;

import com.luning.graduation.dao.SystemUserDao;
import com.luning.graduation.entity.SystemUserBo;
import com.luning.graduation.service.SystemUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author ln
 * 系统用户数据操作的service层实现类
 */
@Service
public class SystemUserServiceImpl implements SystemUserService {

    @Autowired
    private SystemUserDao systemUserDao;

    @Override
    public SystemUserBo getSystemUser(Long id) {
        return systemUserDao.getSystemUser(id);
    }

    @Override
    public List<SystemUserBo> listSystemUser() {
        return systemUserDao.listSystemUser();
    }

    @Override
    public int insertSystemUser(SystemUserBo systemUserBo) {
        return systemUserDao.insertSystemUser(systemUserBo);
    }

    @Override
    public int deleteSystemUser(Long id) {
        return systemUserDao.deleteSystemUser(id);
    }

    @Override
    public int updateSystemUser(SystemUserBo systemUserBo) {
        return systemUserDao.updateSystemUser(systemUserBo);
    }

    @Override
    public int countSystemUser() {
        return systemUserDao.countSystemUser();
    }

    @Override
    public boolean validate(SystemUserBo systemUserBo) {
        return systemUserBo != null && systemUserDao.validate(systemUserBo).size() == 1;
    }

    @Override
    public SystemUserBo getByName(String userName) {
        return systemUserDao.getByName(userName);
    }
}
