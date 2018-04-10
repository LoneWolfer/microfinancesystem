<%--
  Created by IntelliJ IDEA.
  User: ln
  Date: 2018/3/26
  Time: 17:45
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
    搜索姓名：
    <div class="layui-inline">
        <input class="layui-input" id="searchId" autocomplete="off">
    </div>
    <button id="search" class="layui-btn" data-type="reload">搜索</button>
</div>
<table id="customer" lay-filter="customer"></table>

<script type="text/html" id="customerBar">
    <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="update">白名单</a>
</script>

<script type="text/html" id="sex">
    {{# if(d.customerSex == 0) { }}
    男
    {{# }else { }}
    女
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
            id: 'customer',
            elem: "#customer",
            height: 455,
            url: '/customer/black/list',
            page: true,
            cols: [[
                {field: 'id', title: 'ID', width: 70, sort: true},
                {field: 'customerName', title: '客户姓名', width: 100},
                {field: 'customerSex', title: '性别', width: 70, templet: '#sex'},
                {field: 'customerIdcard', title: '身份证号', width: 150},
                {field: 'customerEmail', title: '邮箱', width: 150},
                {field: 'customerPhone', title: '手机号', width: 150},
                {field: 'customerAddress', title: '地址', width: 150},
                {field: 'customerCredit', title: '芝麻信用分', width: 100},
                {field: 'customerCreditcard', title: '银行卡号', width: 150},
                {field: 'customerSalary', title: '月薪', width: 100},
                {field: 'customerCompany', title: '公司', width: 150},
                {field: 'companyAddress', title: '公司地址', width: 150},
                {field: 'companyPhone', title: '公司号码', width: 150},
                {field: 'gmtCreate', title: '创建时间', width: 150, sort: true, templet: '#createTime'},
                {field: 'gmtModified', title: '修改时间', width: 150, sort: true, templet: '#modifyTime '},
                {fixed: 'right', width: 130, align: 'center', toolbar: '#customerBar'}
            ]]
        });

        table.on('tool(customer)', function (obj) {
            var data = obj.data;
            if (obj.event === 'update') {
                layer.confirm('真的将该客户取消黑名单吗', function (index) {
                    layer.close(index);
                    $.ajax({
                        type: 'POST',
                        url: '/customer/black/update?id=' + data.id,
                        success: function (result) {
                            if (result === 'success') {
                                layer.msg("取消黑名单成功!");
                                tableIns.reload();
                            } else {
                                layer.alert("取消黑名单失败!");
                            }
                        },
                        error: function (e) {
                            layer.alert("error " + e);
                        }
                    })
                });
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
