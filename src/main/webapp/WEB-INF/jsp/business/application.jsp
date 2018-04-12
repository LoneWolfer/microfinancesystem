<%--
  Created by IntelliJ IDEA.
  User: ln
  Date: 2018/3/26
  Time: 17:35
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
<table id="application" lay-filter="application"></table>

<form id="insert" hidden="hidden">
    <br>
    <div class="layui-form-item">
        <label class="layui-form-label">贷款客户</label>
        <div class="layui-input-inline">
            <select class="layui-select" id="customerId"></select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">贷款产品</label>
        <div class="layui-input-inline">
            <select id="loanType" class="layui-select"></select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">还款类型</label>
        <div class="layui-input-inline">
            <select id="loanRepayment" class="layui-select"></select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">申请总金额</label>
        <div class="layui-input-inline">
            <input type="text" id="loanSum" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">申请期限</label>
        <div class="layui-input-inline">
            <input type="text" id="loanPeriod" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="insert">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

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
            id: 'application',
            elem: "#application",
            height: 455,
            url: '/business/application/list',
            page: true,
            cols: [[
                {field: 'id', title: 'ID', width: 70, sort: true},
                {field: 'typeName', title: '贷款类型', width: 100},
                {field: 'loanState', title: '状态', width: 100, templet: '#state'},
                {field: 'loanSum', title: '申请总金额', width: 150},
                {field: 'loanRate', title: '贷款利率%', width: 100},
                {field: 'repayName', title: '还款类型', width: 150},
                {field: 'loanDate', title: '申请日期', width: 150, templet: "#loanDate"},
                {field: 'loanPeriod', title: '申请期限(月)', width: 115},
                {field: 'customerName', title: '贷款人', width: 100},
                {field: 'userName', title: '处理人', width: 100},
                {field: 'gmtCreate', title: '创建时间', width: 150, sort: true, templet: '#createTime'},
                {field: 'gmtModified', title: '修改时间', width: 150, sort: true, templet: '#modifyTime '},
            ]]
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

            $.ajax({
                type: 'POST',
                url: '/customer/custom/list',
                async: false,
                success: function (result) {
                    var data = result.data;
                    var str = "<option value='/'>请选择贷款人</option>";
                    for (var i = 0, length = data.length; i < length; i++) {
                        str += "<option value='" + data[i].id + "'>" + data[i].customerName
                            + "</option>";
                    }
                    $("#customerId").html(str);
                }
            });

            $.ajax({
                type: 'POST',
                url: '/business/enum/type',
                async: false,
                success: function (result) {
                    var str = "<option value='/'>请选择贷款类型</option>";
                    for (var i = 0, length = result.length; i < length; i++) {
                        str += "<option value='" + result[i].code + "'>" + result[i].msg
                            + "</option>";
                    }
                    $("#loanType").html(str);
                }
            });

            $.ajax({
                type: 'POST',
                url: '/business/enum/repay',
                async: false,
                success: function (result) {
                    var str = "<option value='/'>请选择还款类型</option>";
                    for (var i = 0, length = result.length; i < length; i++) {
                        str += "<option value='" + result[i].code + "'>" + result[i].msg
                            + "</option>";
                    }
                    $("#loanRepayment").html(str);
                }
            });
            form.render();
            form.on('submit(insert)', function () {
                var businessLoanBo = {
                    customerId: $("#customerId").val(),
                    loanType: $("#loanType").val(),
                    loanRepayment: $("#loanRepayment").val(),
                    loanSum: $("#loanSum").val(),
                    loanPeriod: $("#loanPeriod").val(),
                    loanState: 0
                };
                $.ajax({
                    type: 'POST',
                    url: '/business/application/insert',
                    data: businessLoanBo,
                    success: function (result) {
                        if (result === 'overLimit') {
                            layer.msg("超出贷款额度!")
                        }
                        else if (result === 'success') {
                            layer.msg("插入成功!");
                            tableIns.reload();
                        }
                        else {
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