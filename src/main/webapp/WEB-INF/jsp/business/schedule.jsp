<%--
  Created by IntelliJ IDEA.
  User: ln
  Date: 2018/3/26
  Time: 17:37
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
</div>
<table id="schedule" lay-filter="schedule"></table>

<script type="text/html" id="scheduleBar">
    <a class="layui-btn layui-btn-mini" lay-event="pass">通过</a>
    <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="refuse">拒绝</a>
</script>

<script type="text/html" id="state">
    {{# if(d.loanState == 0) { }}
    <span style="color: #64b3f4;">未处理</span>
    {{# }else if(d.loanState == 1){ }}
    <span style="color: #9bca2c;">通过</span>
    {{# }else { }}
    <span style="color: #F581B1;">未通过</span>
    {{# } }}
</script>

<script type="text/html" id="loanDate">
    {{# if(d.loanDate!=null) { }}
    {{ format(d.loanDate) }}
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
            id: 'schedule',
            elem: "#schedule",
            height: 455,
            url: '/business/schedule/list',
            page: true,
            cols: [[
                {field: 'id', title: 'ID', width: 70, sort: true},
                {field: 'typeName', title: '贷款类型', width: 100},
                {field: 'loanState', title: '状态', width: 100, templet: '#state'},
                {field: 'loanSum', title: '申请总金额', width: 150},
                {field: 'loanRate', title: '贷款利率', width: 100},
                {field: 'repayName', title: '还款类型', width: 150},
                {field: 'loanDate', title: '申请日期', width: 150, templet: "#loanDate"},
                {field: 'loanPeriod', title: '申请期限(月)', width: 115},
                {field: 'customerName', title: '贷款人', width: 100},
                {field: 'userName', title: '处理人', width: 100},
                {field: 'gmtCreate', title: '创建时间', width: 150, sort: true, templet: '#createTime'},
                {field: 'gmtModified', title: '修改时间', width: 150, sort: true, templet: '#modifyTime '},
                {fixed: 'right', width: 130, align: 'center', toolbar: '#scheduleBar'}
            ]]
        });

        table.on('tool(schedule)', function (obj) {
            var data = obj.data;
            if (obj.event === 'pass') {
                layer.confirm('真的通过该申请吗', function (index) {
                    layer.close(index);
                    $.ajax({
                        type: 'POST',
                        url: '/business/schedule/pass?id=' + data.id,
                        success: function (result) {
                            if (result === 'success') {
                                layer.msg("已经通过该申请!");
                                tableIns.reload();
                            } else if (result === 'LackOfMoney') {
                                layer.msg("余额不足!");
                            } else {
                                layer.msg("通过申请失败!");
                            }
                        },
                        error: function (e) {
                            layer.alert("error" + e);
                        }
                    })
                });
            } else if (obj.event === 'refuse') {
                layer.confirm('真的拒绝该申请吗', function (index) {
                    layer.close(index);
                    $.ajax({
                        type: 'POST',
                        url: '/business/schedule/refuse?id=' + data.id,
                        success: function (result) {
                            if (result === 'success') {
                                layer.msg("已经拒绝该申请!");
                                tableIns.reload();
                            } else {
                                layer.msg("通过拒绝失败!");
                            }
                        },
                        error: function (e) {
                            layer.alert("error" + e);
                        }
                    })
                });
            }
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
