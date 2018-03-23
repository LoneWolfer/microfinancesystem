package com.luning.graduation.controller;

import javax.servlet.http.HttpServletResponse;

/**
 * @author ln
 * 控制器基类，封装了http传输数据的方法
 * 其他控制器继承该类
 */
public class BaseController {

    protected void write(HttpServletResponse response, String string)
            throws Exception {
        response.setHeader("Content-Type", "application/json;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");

        byte[] b = string.getBytes("utf-8");
        response.setContentLength(b.length);
        response.getOutputStream().write(b);
        response.flushBuffer();
    }

    protected void writeJsonP(HttpServletResponse response, String callback,
                              String content) throws Exception {
        if (callback != null && callback.trim().length() > 0) {
            content = callback + "&&" + callback + "(" + content + ");";
        }

        response.setHeader("Content-Type", "application/json;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");

        byte[] b = content.getBytes("utf-8");
        response.setContentLength(b.length);
        response.getOutputStream().write(b);
    }
}
