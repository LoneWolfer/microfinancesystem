<%--
  Created by IntelliJ IDEA.
  User: ln
  Date: 2018/3/26
  Time: 17:41
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
<form>
    客户名字：
    <div class="layui-inline">
        <input class="layui-input" id="name">
    </div>
    申请日期：
    <div class="layui-inline">
        <input class="layui-input" id="date">
    </div>
    审批状态：
    <div class="layui-inline">
        <select class="layui-select" id="status">
            <option value="">请选择审批状态</option>
            <option value="0">未处理</option>
            <option value="1">通过</option>
            <option value="2">未通过</option>
        </select>
    </div>
    贷款类型：
    <div class="layui-inline">
        <select class="layui-select" id="type"></select>
    </div>
    <button id="search" class="layui-btn">搜索</button>
</form>
<table id="application" lay-filter="application"></table>

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
    layui.use(['element', 'table', 'form', 'laydate'], function () {
        var table = layui.table,
            form = layui.form,
            laydate = layui.laydate,
            $ = layui.jquery;

        var tableIns = table.render({
            id: 'application',
            elem: "#application",
            height: 455,
            url: '/business/application/search',
            page: true,
            cols: [[
                {field: 'id', title: 'ID', width: 70, sort: true},
                {field: 'typeName', title: '贷款类型', width: 100},
                {field: 'loanState', title: '状态', width: 100, templet: '#state'},
                {field: 'loanSum', title: '申请总金额', width: 150},
                {field: 'loanRate', title: '贷款利率%', width: 100},
                {field: 'repayName', title: '还款类型', width: 150},
                {field: 'loanDate', title: '申请日期', width: 150, templet: "#loanDate"},
                {field: 'loanPeriod', title: '申请期限(天)', width: 100},
                {field: 'customerName', title: '贷款人', width: 100},
                {field: 'userName', title: '处理人', width: 100},
                {field: 'gmtCreate', title: '创建时间', width: 150, sort: true, templet: '#createTime'},
                {field: 'gmtModified', title: '修改时间', width: 150, sort: true, templet: '#modifyTime '},
            ]]
        });

        laydate.render({
            elem: '#date'
        });

        $.ajax({
            type: 'POST',
            url: '/business/enum/type',
            async: false,
            success: function (result) {
                var str = "<option value=''>请选择贷款类型</option>";
                for (var i = 0, length = result.length; i < length; i++) {
                    str += "<option value='" + result[i].code + "'>" + result[i].msg
                        + "</option>";
                }
                $("#type").html(str);
            }
        });

        form.render();

        $("#search").on('click', function () {
            var name = $("#name").val();
            var type = $("#type").val();
            var state = $("#status").val();
            var date = $("#date").val();
            //执行重载
            tableIns.reload({
                // page: {
                //     curr: 1 //重新从第 1 页开始
                // },
                where: {
                    name: name,
                    type: type,
                    state: state,
                    date: date
                }
            });
            return false;
        })
    });
</script>
</body>
</html>
