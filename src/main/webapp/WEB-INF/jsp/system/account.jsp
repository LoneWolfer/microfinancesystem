<%@ page import="com.luning.graduation.entity.SystemUserBo" %>
<%@ page import="com.luning.graduation.util.SessionKeyConst" %><%--
  Created by IntelliJ IDEA.
  User: ln
  Date: 2018/3/26
  Time: 17:43
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    SystemUserBo systemUserBo = (SystemUserBo) session.getAttribute(SessionKeyConst.USER_INFO);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title></title>
    <link rel="stylesheet" href="<%=basePath%>frame/layui/css/layui.css">
</head>
<body>
<input id="id" type="hidden">
<form id="account" style="position: absolute;top: 20%;left: 30%">
    <div class="layui-form-item">
        <label class="layui-form-label" for="name">用户名</label>
        <div class="layui-input-inline">
            <input type="text" id="name" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" for="password">密码</label>
        <div class="layui-input-inline">
            <input type="text" id="password" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" for="phone">手机号</label>
        <div class="layui-input-inline">
            <input type="text" id="phone" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" for="address">地址</label>
        <div class="layui-input-inline">
            <input type="text" id="address" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="modify">立即提交</button>
        </div>
    </div>
</form>

<script src="<%=basePath%>frame/layui/layui.js"></script>

<script type="text/javascript">
    layui.use(['element', 'form'], function () {
        var form = layui.form,
            $ = layui.jquery;

        $("#id").val('<%=systemUserBo.getId()%>');
        $("#name").val('<%=systemUserBo.getUserName()%>');
        $("#password").val('<%=systemUserBo.getPassword()%>');
        $("#phone").val('<%=systemUserBo.getPhone()%>');
        $("#address").val('<%=systemUserBo.getAddress()%>');

        form.render();

        form.on('submit(modify)', function () {
            var userName = $("#name").val();
            var password = $("#password").val();
            var phone = $("#phone").val();
            var address = $("#address").val();
            var systemUserBo = {
                id:parseInt($("#id").val()),
                userName:userName,
                password:password,
                phone:phone,
                address:address
            };

            $.ajax({
                type:'POST',
                url:'/system/user/update',
                data:systemUserBo,
                success:function (result) {
                    if (result === 'success'){
                        layer.alert("更新成功!");
                    }else {
                        layer.alert("更新失败!");
                    }
                },
                error:function (e) {
                    layer.alert("error " + e);
                }
            });
            return false;
        })
    })
</script>
</body>
</html>
