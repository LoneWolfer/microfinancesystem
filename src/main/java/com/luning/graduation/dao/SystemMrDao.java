package com.luning.graduation.dao;

import com.luning.graduation.entity.SystemMrBo;

import java.util.List;

public interface SystemMrDao {

    List<SystemMrBo> listSystemMr(Long roleId);
}