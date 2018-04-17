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
    <link rel="stylesheet" href="<%=basePath%>frame/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
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
<table id="role" lay-filter="sysRole"></table>

<form id="roleModify" hidden="hidden">
    <br>
    <div class="layui-form-item">
        <input type="text" id="id" hidden="hidden">
        <label class="layui-form-label">角色名</label>
        <div class="layui-input-inline">
            <input type="text" id="name" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-inline">
            <input type="text" id="info" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="update">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<form id="roleAdd" hidden="hidden">
    <br>
    <div class="layui-form-item">
        <label class="layui-form-label">角色名</label>
        <div class="layui-input-inline">
            <input type="text" id="nameAdd" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-inline">
            <input type="text" id="infoAdd" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="insert">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<div id="tree" hidden="hidden">
    <div style="position: absolute;top: 0;left: 10%;height: 75%;overflow: auto">
        <ul id="treeDemo" class="ztree"></ul>
    </div>
    <div style="position: absolute;left: 15%;bottom: 10%">
        <button id="authMenu" class="layui-btn layui-btn-normal">保存</button>
    </div>
</div>


<script type="text/html" id="roleBar">
    <a class="layui-btn layui-btn-normal layui-btn-mini" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="delete">删除</a>
    <a class="layui-btn layui-btn-mini" lay-event="auth">管理权限</a>
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
<script src="<%=basePath%>frame/zTree/js/jquery-1.4.4.min.js"></script>
<script src="<%=basePath%>frame/zTree/js/jquery.ztree.core.js"></script>
<script src="<%=basePath%>frame/zTree/js/jquery.ztree.excheck.js"></script>
<script src="<%=basePath%>frame/zTree/js/jquery.ztree.exedit.js"></script>
<script src="<%=basePath%>js/format.js"></script>

<script type="text/javascript">
    layui.use(['element', 'table', 'form'], function () {
        var table = layui.table,
            form = layui.form,
            $ = layui.jquery;

        var tableIns = table.render({
            elem: "#role",
            height: 455,
            url: '/system/role/list',
            page: true,
            cols: [[
                {field: 'id', title: 'ID', width: 100, sort: true},
                {field: 'roleName', title: '角色名', width: 150},
                {field: 'info', title: '备注', width: 300},
                {field: 'gmtCreate', title: '创建时间', width: 205, sort: true, templet: '#createTime'},
                {field: 'gmtModified', title: '修改时间', width: 200, sort: true, templet: '#modifyTime '},
                {fixed: 'right', width: 200, align: 'center', toolbar: '#roleBar'}
            ]]
        });

        table.on('tool(sysRole)', function (obj) {
            var data = obj.data;
            if (obj.event === 'delete') {
                layer.confirm('真的删除该角色吗', function (index) {
                    layer.close(index);
                    $.ajax({
                        type: 'POST',
                        url: '/system/role/delete?id=' + data.id,
                        success: function (result) {
                            if (result === 'success') {
                                layer.msg("删除成功!");
                                tableIns.reload();
                            } else {
                                layer.alert("删除失败!");
                            }
                        },
                        error: function (e) {
                            layer.alert("error " + e);
                        }
                    })
                });
            } else if (obj.event === 'edit') {
                $("#id").val(data.id);
                $("#name").val(data.roleName);
                $("#info").val(data.info);
                layer.open({
                    type: 1,
                    title: '信息编辑',
                    skin: 'layui-layer-lan',
                    shadeClose: true,
                    area: ['400px', '350px'],
                    content: $('#roleModify')
                });
                form.render();
                form.on('submit(update)', function () {
                    var systemRoleBo = {
                        id: parseInt($("#id").val()),
                        roleName: $("#name").val(),
                        info: $("#info").val()
                    };
                    $.ajax({
                        type: 'POST',
                        url: '/system/role/update',
                        data: systemRoleBo,
                        success: function (result) {
                            if (result === 'success') {
                                layer.msg("更新成功!");
                                obj.update({
                                    roleName: systemRoleBo.roleName,
                                    info: systemRoleBo.info
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
                    url: '/system/mr/clear?roleId=' + data.id,
                    success: function (result) {
                        if (result === 'success') {
                            console.log("清除权限成功");
                        }
                    }
                });
                $.ajax({
                    type: 'POST',
                    url: '/system/menu/list',
                    success: function (result) {
                        var zNodes = [];
                        result.forEach(function (value) {
                            var node = {
                                id: value.menuId,
                                pId: value.parentId,
                                name: value.menuName,
                                open: true
                            };
                            zNodes.push(node);
                        });
                        initTree(zNodes);
                    }
                });
                layer.open({
                    type: 1,
                    title: '信息编辑',
                    skin: 'layui-layer-lan',
                    shadeClose: true,
                    area: ['200px', '400px'],
                    content: $('#tree')
                });
                $("#authMenu").on('click', function () {
                    saveAuth(data.id);
                })
            }
        });

        $("#add").on('click', function () {
            layer.open({
                type: 1,
                title: '信息编辑',
                skin: 'layui-layer-lan',
                shadeClose: true,
                area: ['400px', '350px'],
                content: $('#roleAdd')
            });
            form.render();
            form.on('submit(insert)', function () {
                var systemRoleBo = {
                    roleName: $("#nameAdd").val(),
                    info: $("#infoAdd").val()
                };
                $.ajax({
                    type: 'POST',
                    url: '/system/role/insert',
                    data: systemRoleBo,
                    success: function (result) {
                        if (result === 'success') {
                            layer.msg("插入成功!");
                            tableIns.reload();
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
            return false;
        });
    });
</script>
<script type="text/javascript">

    var setting = {
        view: {
            selectedMulti: false
        },
        check: {
            enable: true
        },
        data: {
            simpleData: {
                enable: true
            }
        }
    };

    var code, log, className = "dark";

    function checkNode(e) {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
            type = e.data.type,
            nodes = zTree.getSelectedNodes();
        if (type.indexOf("All") < 0 && nodes.length === 0) {
            alert("请先选择一个节点");
        }

        if (type === "checkAllTrue") {
            zTree.checkAllNodes(true);
        } else if (type === "checkAllFalse") {
            zTree.checkAllNodes(false);
        } else {
            var callbackFlag = $("#callbackTrigger").attr("checked");
            for (var i = 0, l = nodes.length; i < l; i++) {
                if (type === "checkTrue") {
                    zTree.checkNode(nodes[i], true, false, callbackFlag);
                } else if (type === "checkFalse") {
                    zTree.checkNode(nodes[i], false, false, callbackFlag);
                } else if (type === "toggle") {
                    zTree.checkNode(nodes[i], null, false, callbackFlag);
                } else if (type === "checkTruePS") {
                    zTree.checkNode(nodes[i], true, true, callbackFlag);
                } else if (type === "checkFalsePS") {
                    zTree.checkNode(nodes[i], false, true, callbackFlag);
                } else if (type === "togglePS") {
                    zTree.checkNode(nodes[i], null, true, callbackFlag);
                }
            }
        }
    }

    function setAutoTrigger(e) {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.setting.check.autoCheckTrigger = $("#autoCallbackTrigger").attr("checked");
        $("#autoCheckTriggerValue").html(zTree.setting.check.autoCheckTrigger ? "true" : "false");
    }


    function initTree(nodes) {
        $.fn.zTree.init($("#treeDemo"), setting, nodes);
        $("#checkTrue").bind("click", {type: "checkTrue"}, checkNode);
        $("#checkFalse").bind("click", {type: "checkFalse"}, checkNode);
        $("#toggle").bind("click", {type: "toggle"}, checkNode);
        $("#checkTruePS").bind("click", {type: "checkTruePS"}, checkNode);
        $("#checkFalsePS").bind("click", {type: "checkFalsePS"}, checkNode);
        $("#togglePS").bind("click", {type: "togglePS"}, checkNode);
        $("#checkAllTrue").bind("click", {type: "checkAllTrue"}, checkNode);
        $("#checkAllFalse").bind("click", {type: "checkAllFalse"}, checkNode);
        $("#autoCallbackTrigger").bind("change", {}, setAutoTrigger);
    }

    function saveAuth(roleId) {
        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        var nodes = treeObj.getCheckedNodes(true);
        var arr = [];
        nodes.forEach(function (value) {
            arr.push(value.id);
        });
        $.ajax({
            type: 'POST',
            url: '/system/mr/update?menuIds=' + arr,
            data: {roleId: roleId},
            success: function (result) {
                console.log(result);
                if (result === 'success') {
                    layer.msg("保存成功!");
                } else {
                    layer.msg("保存失败");
                }
            },
            error: function (e) {
                layer.alert("error " + e);
            }
        });
    }
</script>
</body>
</html>
