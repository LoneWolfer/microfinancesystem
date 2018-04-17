package com.luning.graduation.dao;

import com.luning.graduation.entity.SystemMrBo;
import com.luning.graduation.entity.SystemUrBo;

import java.util.List;

public interface SystemMrDao {

    List<SystemMrBo> listSystemMr(Long roleId);

    int updateSystemMr(SystemMrBo systemMrBo);

    int clearMr(Long roleId);

    int insertMr(SystemMrBo systemMrBo);
}