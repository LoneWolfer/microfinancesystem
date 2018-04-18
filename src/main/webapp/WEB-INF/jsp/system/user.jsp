<%--
  Created by IntelliJ IDEA.
  User: ln
  Date: 2018/3/26
  Time: 17:43
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
    <title></title>
    <link rel="stylesheet" href="<%=basePath%>frame/layui/css/layui.css">
</head>
<body>
<br>
<div>
    搜索ID：
    <div class="layui-inline">
        <input class="layui-input" id="searchId" autocomplete="off">
    </div>
    <button id="search" class="layui-btn" data-type="reload">搜索</button>
    <button id="add" class="layui-btn">新增</button>
</div>

<table id="systemUser" lay-filter="systemUser"></table>

<form id="modify" hidden="hidden">
    <br>
    <div class="layui-form-item">
        <input type="text" id="id" hidden="hidden">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input type="text" id="name" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="text" id="password" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">手机号</label>
        <div class="layui-input-inline">
            <input type="text" id="phone" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">地址</label>
        <div class="layui-input-inline">
            <input type="text" id="address" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="update">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<form id="insert" hidden="hidden">
    <br>
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input type="text" id="nameAdd" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="text" id="passwordAdd" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">手机号</label>
        <div class="layui-input-inline">
            <input type="text" id="phoneAdd" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">地址</label>
        <div class="layui-input-inline">
            <input type="text" id="addressAdd" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="insert">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<form id="auth" hidden="hidden">
    <br>
    <div class="layui-form-item">
        <label class="layui-form-label">权限角色</label>
        <div class="layui-input-inline">
            <select id="authS" class="layui-select"></select>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="auth">立即提交</button>
        </div>
    </div>
</form>

<script type="text/html" id="systemUserBar">
    <a class="layui-btn layui-btn-mini" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="forbid">禁用</a>
    <a class="layui-btn layui-btn-normal layui-btn-mini" lay-event="auth">授权</a>
</script>

<script type="text/html" id="userStatus">
    {{# if(d.status == 1) { }}
    <span style="color: #9bca2c;">启用</span>
    {{# }else { }}
    <span style="color: #F581B1;">禁用</span>
    {{# } }}
</script>

<script type="text/html" id="createTime">
    {{# if(d.gmtCreate!=null) { }}
    {{ format(d.gmtCreate) }}
    {{# } }}
</script>

<script type="text/html" id="modifyTime">
    {{# if(d.gmtModified!=null) { }}
    {{ format(d.gmtModified) }}
    {{# } }}
</script>

<script src="<%=basePath%>frame/layui/layui.js"></script>
<script src="<%=basePath%>js/format.js"></script>

<script type="text/javascript">
    layui.use(['element', 'table', 'form'], function () {
        var table = layui.table,
            form = layui.form,
            $ = layui.jquery;

        var tableIns = table.render({
            id: 'sysUser',
            elem: "#systemUser",
            height: 455,
            url: '/system/user/list',
            page: true,
            cols: [[
                {field: 'id', title: 'ID', width: 100, sort: true},
                {field: 'userName', title: '用户名', width: 100},
                {field: 'password', title: '密码', width: 150},
                {field: 'phone', title: '手机号', width: 150},
                {field: 'address', title: '地址', width: 150},
                {field: 'gmtCreate', title: '创建时间', width: 150, sort: true, templet: '#createTime'},
                {field: 'gmtModified', title: '修改时间', width: 150, sort: true, templet: '#modifyTime '},
                {field: 'status', title: '账号状态', width: 100, templet: '#userStatus'},
                {fixed: 'right', width: 190, align: 'center', toolbar: '#systemUserBar'}
            ]]
        });

        table.on('tool(systemUser)', function (obj) {
            var data = obj.data;
            if (obj.event === 'forbid') {
                layer.confirm('真的禁用该用户吗', function (index) {
                    layer.close(index);
                    var systemUserBo = {
                        id: data.id,
                        status: 0
                    };
                    $.ajax({
                        type: 'POST',
                        url: '/system/user/forbid',
                        data: systemUserBo,
                        success: function (result) {
                            if (result === 'success') {
                                layer.msg("禁用成功!");
                                obj.update({
                                    status: 0
                                })
                            } else {
                                layer.alert("禁用失败!");
                            }
                        },
                        error: function (e) {
                            layer.alert("error " + e);
                        }
                    })
                });
            } else if (obj.event === 'edit') {
                $("#id").val(data.id);
                $("#name").val(data.userName);
                $("#password").val(data.password);
                $("#phone").val(data.phone);
                $("#address").val(data.address);
                layer.open({
                    type: 1,
                    title: '信息编辑',
                    skin: 'layui-layer-lan',
                    shadeClose: true,
                    area: ['400px', '350px'],
                    content: $('#modify')
                });
                form.render();
                form.on('submit(update)', function () {
                    var systemUserBo = {
                        id: parseInt($("#id").val()),
                        userName: $("#name").val(),
                        password: $("#password").val(),
                        phone: $("#phone").val(),
                        address: $("#address").val()
                    };
                    $.ajax({
                        type: 'POST',
                        url: '/system/user/update',
                        data: systemUserBo,
                        success: function (result) {
                            if (result === 'success') {
                                layer.msg("更新成功!");
                                obj.update({
                                    userName: systemUserBo.userName,
                                    password: systemUserBo.password,
                                    phone: systemUserBo.phone,
                                    address: systemUserBo.address
                                })
                            } else {
                                layer.alert("更新失败!");
                            }
                        },
                        error: function (e) {
                            layer.alert("error + " + e);
                        }
                    });
                    return false;
                });
            } else if (obj.event === 'auth') {
                $.ajax({
                    type: 'POST',
                    url: '/system/role/list',
                    success: function (result) {
                        var data = result.data;
                        var str = "<option value=''>请选择角色</option>";
                        for (var i = 0, length = data.length; i < length; i++) {
                            str += "<option value='" + data[i].id + "'>" + data[i].roleName + "</option>";
                        }
                        $("#authS").html(str);
                    }
                });
                layer.open({
                    type: 1,
                    title: '信息编辑',
                    skin: 'layui-layer-lan',
                    shadeClose: true,
                    area: ['400px', '200px'],
                    content: $('#auth')
                });
                form.render();
                form.on('submit(auth)', function () {
                    var systemUrBo = {
                        userId: data.id,
                        roleId: parseInt($("#authS").val())
                    };
                    $.ajax({
                        type: 'POST',
                        url: '/system/ur/update',
                        data: systemUrBo,
                        success: function (result) {
                            if (result === 'success') {
                                layer.alert("授权成功!");
                            } else {
                                layer.alert("授权失败!");
                            }
                        }
                    });
                    return false;
                });
            }
        });

        $("#add").on('click', function () {
            layer.open({
                type: 1,
                title: '信息编辑',
                skin: 'layui-layer-lan',
                shadeClose: true,
                area: ['400px', '350px'],
                content: $('#insert')
            });
            form.render();
            form.on('submit(insert)', function () {
                var systemUserBo = {
                    userName: $("#nameAdd").val(),
                    password: $("#passwordAdd").val(),
                    phone: $("#phoneAdd").val(),
                    address: $("#addressAdd").val(),
                    status: 1
                };
                $.ajax({
                    type: 'POST',
                    url: '/system/user/insert',
                    data: systemUserBo,
                    success: function (result) {
                        if (result === 'success') {
                            layer.msg("插入成功!");
                            tableIns.reload();
                        } else if (result === 'errorName') {
                            layer.alert("用户名已经注册!");
                        } else {
                            layer.alert("插入失败!");
                        }
                    },
                    error: function (e) {
                        layer.alert("error + " + e);
                    }
                });
                return false;
            });
        });

        $("#search").on('click', function () {
            var id = $("#searchId").val();
            //执行重载
            tableIns.reload({
                // page: {
                //     curr: 1 //重新从第 1 页开始
                // },
                where: {
                    key: id
                }
            });
        })
    });
</script>
</body>
</html>
