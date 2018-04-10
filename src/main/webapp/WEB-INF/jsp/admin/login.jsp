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
    <title>登录</title>
    <link rel="stylesheet" href="<%=basePath%>frame/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>frame/static/css/style.css">
    <link rel="icon" href="<%=basePath%>frame/static/image/code.png">
</head>
<body>
<input type="hidden" id="message" value="${pageCode.msg}"/>
<div class="login-main">
    <header class="layui-elip">后台登陆</header>
    <form class="layui-form" action="<%=basePath%>login/validate">
        <div class="layui-input-inline">
            <input type="text" name="account" required lay-verify="required" placeholder="账号" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="password" name="password" required lay-verify="required" placeholder="密码" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline login-btn">
            <button class="layui-btn" type="submit">登录</button>
        </div>
        <hr/>
        <p><a href="" class="fl">立即注册</a><a href="" class="fr">忘记密码？</a></p>
    </form>
</div>


<script src="<%=basePath%>frame/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form'], function () {

        // 操作对象
        var form = layui.form,
            layer = layui.layer,
            $ = layui.jquery;

        form.render();

        function showMessage(msg) {
            if (msg) {
                layer.alert(msg);
            }
        }

        showMessage($("#message").val());
    });
</script>
</body>
</html>
