<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ln
  Date: 2018/3/9 0008
  Time: 09:06
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>首页 · 后台系统</title>
    <link rel="stylesheet" href="<%=basePath%>frame/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>frame/static/css/style.css">
    <link rel="icon" href="<%=basePath%>frame/static/image/code.png">
</head>
<body>

<!-- layout admin -->
<div class="layui-layout layui-layout-admin"> <!-- 添加skin-1类可手动修改主题为纯白，添加skin-2类可手动修改主题为蓝白 -->
    <!-- header -->
    <div class="layui-header my-header">
        <a href="admin">
            <!--<img class="my-header-logo" src="" alt="logo">-->
            <div class="my-header-logo">后台管理系统</div>
        </a>
        <div class="my-header-btn">
            <button class="layui-btn layui-btn-small btn-nav"><i class="layui-icon">&#xe65f;</i></button>
        </div>

        <!-- 顶部左侧添加选项卡监听 -->
        <ul class="layui-nav" lay-filter="side-top-left"></ul>

        <!-- 顶部右侧添加选项卡监听 -->
        <ul class="layui-nav my-header-user-nav" lay-filter="side-top-right">
            <li class="layui-nav-item">
                <a class="name" href="javascript:;"><i class="layui-icon">&#xe629;</i>主题</a>
                <dl class="layui-nav-child">
                    <dd data-skin="0"><a href="javascript:;">默认</a></dd>
                    <dd data-skin="1"><a href="javascript:;">纯白</a></dd>
                    <dd data-skin="2"><a href="javascript:;">蓝白</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a class="name" href="javascript:;"><img src="<%=basePath%>frame/static/image/code.png" alt="logo">
                    Admin </a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;" href-url="<%=basePath%>welcome"><i
                            class="layui-icon">&#xe621;</i>登录页</a></dd>
                    <dd><a href="javascript:;" href-url="<%=basePath%>welcome"><i class="layui-icon">&#xe621;</i>图表</a>
                    </dd>
                    <dd><a href="/"><i class="layui-icon">&#x1006;</i>退出</a></dd>
                </dl>
            </li>
        </ul>

    </div>
    <!-- side -->
    <div class="layui-side my-side">
        <div class="layui-side-scroll">
            <!-- 左侧主菜单添加选项卡监听 -->
            <ul class="layui-nav layui-nav-tree" lay-filter="side-main"></ul>
        </div>
    </div>
    <!-- body -->
    <div class="layui-body my-body">
        <div class="layui-tab layui-tab-card my-tab" lay-filter="card" lay-allowClose="true">
            <ul class="layui-tab-title">
                <li class="layui-this" lay-id="1"><span><i class="layui-icon">&#xe638;</i>欢迎页</span></li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <iframe id="iframe" src="<%=basePath%>welcome" frameborder="0"></iframe>
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
    <div class="layui-footer my-footer">
        <p>毕业作品</p>
        <p>基于芝麻信用分的小额借贷管理系统后台</p>
    </div>
</div>

<!-- 右键菜单 -->
<div class="my-dblclick-box none">
    <table class="layui-tab dblclick-tab">
        <tr class="card-refresh">
            <td><i class="layui-icon">&#x1002;</i>刷新当前标签</td>
        </tr>
        <tr class="card-close">
            <td><i class="layui-icon">&#x1006;</i>关闭当前标签</td>
        </tr>
        <tr class="card-close-all">
            <td><i class="layui-icon">&#x1006;</i>关闭所有标签</td>
        </tr>
    </table>
</div>

<script type="text/javascript" src="<%=basePath%>frame/layui/layui.js"></script>
<script type="text/javascript" src="<%=basePath%>frame/static/js/vip_comm.js"></script>
<script type="text/javascript">
    layui.use(['layer', 'vip_nav'], function () {

        // 操作对象
        var layer = layui.layer
            , vipNav = layui.vip_nav
            , $ = layui.jquery;

        // 顶部左侧菜单生成 [请求地址,过滤ID,是否展开,携带参数]
        <%--vipNav.top_left('<%=basePath%>json/nav_top_left.json', 'side-top-left', false);--%>
        // 主体菜单生成 [请求地址,过滤ID,是否展开,携带参数]
        <%--vipNav.main('<%=basePath%>system/auth/list', 'side-main', false);--%>
        vipNav.main('<%=basePath%>json/nav_main.json', 'side-main', false);

    });
</script>
</body>
</html>