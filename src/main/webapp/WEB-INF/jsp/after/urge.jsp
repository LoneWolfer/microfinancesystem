<%--
  Created by IntelliJ IDEA.
  User: ln
  Date: 2018/3/26
  Time: 17:39
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
    搜索用户：
    <div class="layui-inline">
        <input class="layui-input" id="searchId" autocomplete="off">
    </div>
    <button id="search" class="layui-btn">搜索</button>
</div>

<table id="urge" lay-filter="urge"></table>

<script type="text/html" id="urgeBar">
    <a class="layui-btn layui-btn-mini" lay-event="call">电话</a>
    <a class="layui-btn layui-btn-normal layui-btn-mini" lay-event="message">短信</a>
</script>

<script type="text/html" id="credit">
    <span style="color: #64b3f4;">{{ d.credit }}</span>
</script>

<script src="<%=basePath%>frame/layui/layui.js"></script>
<script src="<%=basePath%>js/format.js"></script>

<script type="text/javascript">
    layui.use(['element', 'table', 'form'], function () {
        var table = layui.table,
            $ = layui.jquery;

        var tableIns = table.render({
            id: 'urge',
            elem: "#urge",
            height: 455,
            url: '/json/urge_data.json',
            page: true,
            cols: [[
                {field: 'id', title: 'ID', width: 150, sort: true},
                {field: 'name', title: '客户姓名', width: 150},
                {field: 'loanDate', title: '贷款日期', width: 150},
                {field: 'toDate', title: '到期日期', width: 150},
                {field: 'phone', title: '手机号', width: 200},
                {field: 'address', title: '地址', width: 150},
                {field: 'credit', title: '芝麻信用分', width: 100, templet: '#credit'},
                {fixed: 'right', width: 130, align: 'center', toolbar: '#urgeBar'}
            ]]
        });

        table.on('tool(urge)', function (obj) {
            if (obj.event === 'call') {
                layer.msg("已经电话通知提醒客户还款!");
            } else if (obj.event === 'message') {
                layer.msg("已经短信通知提醒客户还款!");
            }
        });

        $("#search").on('click', function () {
            var name = $("#searchId").val();
            //执行重载
            tableIns.reload({
                // page: {
                //     curr: 1 //重新从第 1 页开始
                // },
                where: {
                    key: name
                }
            });
        })
    });
</script>
</body>
</html>
