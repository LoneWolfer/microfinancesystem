package com.luning.graduation;

/**
 * @author ln
 * 登陆回调枚举类
 */

public enum PageCodeEnum {
    //登陆失败
    LOGIN_FAIL(1201, "登录失败！用户名密码错误！"),
    //登陆超时
    SESSION_TIMEOUT(1202, "session超时，请重新登录！"),
    //账号停用
    LOGIN_FORBID(1203, "账号已被停用！"),
    //没有权限
    NO_AUTHORITY(1204, "该账号没有权限！");

    private Integer code;
    private String msg;

    public static final String KEY = "pageCode";

    PageCodeEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
