<%--
  Created by IntelliJ IDEA.
  User: ln
  Date: 2018/3/26
  Time: 17:40
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

<table id="break" lay-filter="break"></table>

<div id="limitDate" hidden="hidden">
    <br>
    <div class="layui-form-item">
        <label class="layui-form-label">纠正还款期限</label>
        <div class="layui-input-inline">
            <select id="date" class="layui-select">
                <option value="">请选择纠正还款期限</option>
                <option value="1">1个月</option>
                <option value="2">2个月</option>
                <option value="3">3个月</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" id="send">立即提交</button>
        </div>
    </div>
</div>

<script type="text/html" id="breakBar">
    <a class="layui-btn layui-btn-mini" lay-event="rate">追加利息</a>
    <a class="layui-btn layui-btn-normal layui-btn-mini" lay-event="deadline">限期纠正</a>
</script>

<script type="text/html" id="credit">
    <span style="color: #64b3f4;">{{ d.credit }}</span>
</script>

<script src="<%=basePath%>frame/layui/layui.js"></script>
<script src="<%=basePath%>js/format.js"></script>

<script type="text/javascript">
    layui.use(['element', 'table', 'form'], function () {
        var table = layui.table,
            form = layui.form,
            $ = layui.jquery;

        var tableIns = table.render({
            id: 'break',
            elem: "#break",
            height: 455,
            url: '/json/break_data.json',
            page: true,
            cols: [[
                {field: 'id', title: 'ID', width: 150, sort: true},
                {field: 'name', title: '客户姓名', width: 150},
                {field: 'loanDate', title: '贷款日期', width: 150},
                {field: 'toDate', title: '到期日期', width: 150},
                {field: 'phone', title: '手机号', width: 200},
                {field: 'address', title: '地址', width: 150},
                {field: 'credit', title: '芝麻信用分', width: 100, templet: '#credit'},
                {fixed: 'right', width: 190, align: 'center', toolbar: '#breakBar'}
            ]]
        });

        table.on('tool(break)', function (obj) {
            if (obj.event === 'rate') {
                layer.msg("已经在原贷款利率基础上追加30%罚息!");
            } else if (obj.event === 'deadline') {
                layer.open({
                    type: 1,
                    title: '信息编辑',
                    skin: 'layui-layer-lan',
                    shadeClose: true,
                    area: ['400px', '250px'],
                    content: $('#limitDate')
                });
            }
        });

        $("#send").on('click', function () {
            layer.msg("已限期" + $("#date").val() + "个月");
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
