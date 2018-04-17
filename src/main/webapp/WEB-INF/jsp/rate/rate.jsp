<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/4/8
  Time: 16:58
  To change this template use File | Settings | File Templates.
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
    搜索芝麻信用分：
    <div class="layui-inline">
        <input class="layui-input" id="searchId" autocomplete="off">
    </div>
    <button id="search" class="layui-btn">搜索</button>
    <button id="add" class="layui-btn">新增</button>&nbsp;&nbsp;&nbsp;&nbsp;
    余额：<span id="money" style="color: #64b3f4;"></span>
</div>
<table id="rate" lay-filter="rate"></table>

<form id="modify" hidden="hidden">
    <br>
    <input type="text" id="id" hidden="hidden">
    <div class="layui-form-item">
        <label class="layui-form-label">利率</label>
        <div class="layui-input-inline">
            <input type="text" id="loanRate" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">额度</label>
        <div class="layui-input-inline">
            <input type="text" id="loanLimit" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">信用分范围最小值</label>
        <div class="layui-input-inline">
            <input type="text" id="min" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">信用分范围最大值</label>
        <div class="layui-input-inline">
            <input type="text" id="max" autocomplete="off" class="layui-input">
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
        <label class="layui-form-label">利率</label>
        <div class="layui-input-inline">
            <input type="text" id="loanRateAdd" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">额度</label>
        <div class="layui-input-inline">
            <input type="text" id="loanLimitAdd" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">信用分范围最小值</label>
        <div class="layui-input-inline">
            <input type="text" id="minAdd" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">信用分范围最大值</label>
        <div class="layui-input-inline">
            <input type="text" id="maxAdd" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="insert">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<script type="text/html" id="rateBar">
    <a class="layui-btn layui-btn-mini" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="delete">删除</a>
</script>

<script type="text/html" id="credit">
    <span style="color: #64b3f4;">{{ d.creditRange }}</span>
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

        var sum = null;
        $.ajax({
            type:'POST',
            url:'/business/money/get',
            async:false,
            success:function (result) {
                sum = result.money;
            }
        });

        $("#money").html(sum);

        var tableIns = table.render({
            id: 'rate',
            elem: "#rate",
            height: 455,
            url: '/rate/rate/list',
            page: true,
            cols: [[
                {field: 'id', title: 'ID', sort: true, width: 100},
                {field: 'loanRate', title: '贷款利率%', width: 150},
                {field: 'loanLimit', title: '贷款额度', width: 150},
                {field: 'creditRange', title: '芝麻信用分范围', width: 200, templet:'#credit'},
                {field: 'gmtCreate', title: '创建时间', width: 250, sort: true, templet: '#createTime'},
                {field: 'gmtModified', title: '修改时间', width: 250, sort: true, templet: '#modifyTime '},
                {fixed: 'right', width: 130, align: 'center', toolbar: '#rateBar'}
            ]]
        });

        table.on('tool(rate)', function (obj) {
            var data = obj.data;
            console.log(data);
            if (obj.event === 'delete') {
                layer.confirm('真的删除该条吗', function (index) {
                    layer.close(index);
                    $.ajax({
                        type: 'POST',
                        url: '/rate/rate/delete?id=' + data.id,
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
                var str = data.creditRange;
                var arr = str.split(",");
                $("#id").val(data.id);
                $("#loanRate").val(data.loanRate);
                $("#loanLimit").val(data.loanLimit);
                $("#min").val(arr[0]);
                $("#max").val(arr[1]);
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
                    var min = $("#min").val();
                    var max = $("#max").val();
                    var creditRange = min + "," + max;
                    var businessRateBo = {
                        id: parseInt($("#id").val()),
                        loanRate: $("#loanRate").val(),
                        loanLimit: $("#loanLimit").val(),
                        creditRange: creditRange
                    };
                    $.ajax({
                        type: 'POST',
                        url: '/rate/rate/update',
                        data: businessRateBo,
                        success: function (result) {
                            if (result === 'success') {
                                layer.msg("更新成功!");
                                obj.update({
                                    loanRate: businessRateBo.loanRate,
                                    loanLimit: businessRateBo.loanLimit,
                                    creditRange: businessRateBo.creditRange
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
                var min = $("#minAdd").val();
                var max = $("#maxAdd").val();
                var creditRange = min + "," + max;
                var businessRateBo = {
                    loanRate: $("#loanRateAdd").val(),
                    loanLimit: $("#loanLimitAdd").val(),
                    creditRange: creditRange
                };
                $.ajax({
                    type: 'POST',
                    url: '/rate/rate/insert',
                    data: businessRateBo,
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
            var credit = $("#searchId").val();
            $.ajax({
                type: 'POST',
                url: '/rate/rate/list',
                success: function (result) {
                    var data = result.data;
                    data.forEach(function (value) {
                        var arr = value.creditRange.split(",");
                        if (credit >= parseInt(arr[0]) && credit <= parseInt(arr[1])) {
                            layer.alert("该芝麻信用分对应的利率为 <span style='color: #64b3f4;'>"
                                + value.loanRate + "</span><br>"
                                + "贷款额度为 <span style='color: #64b3f4;'>"
                                + value.loanLimit + "</span><br>");
                        }
                    });
                }
            })
        })
    });
</script>
</body>
</html>
