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
    <button id="add" class="layui-btn">新增</button>
</div>
<table id="customer" lay-filter="customer"></table>

<form id="modify" hidden="hidden">
    <br>
    <input type="text" id="id" hidden="hidden">
    <div class="layui-form-item">
        <label class="layui-form-label">客户姓名</label>
        <div class="layui-input-inline">
            <input type="text" id="name" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-inline">
            <input type="text" id="customerSex" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">身份证号</label>
        <div class="layui-input-inline">
            <input type="text" id="idCard" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-inline">
            <input type="text" id="email" autocomplete="off" class="layui-input">
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
        <label class="layui-form-label">芝麻信用分</label>
        <div class="layui-input-inline">
            <input type="text" id="credit" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">银行卡号</label>
        <div class="layui-input-inline">
            <input type="text" id="bankCard" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">月薪</label>
        <div class="layui-input-inline">
            <input type="text" id="salary" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">公司</label>
        <div class="layui-input-inline">
            <input type="text" id="company" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">公司地址</label>
        <div class="layui-input-inline">
            <input type="text" id="companyAddress" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">公司号码</label>
        <div class="layui-input-inline">
            <input type="text" id="companyPhone" autocomplete="off" class="layui-input">
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
        <label class="layui-form-label">客户姓名</label>
        <div class="layui-input-inline">
            <input type="text" id="nameAdd" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-inline">
            <input type="text" id="customerSexAdd" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">身份证号</label>
        <div class="layui-input-inline">
            <input type="text" id="idCardAdd" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-inline">
            <input type="text" id="emailAdd" autocomplete="off" class="layui-input">
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
        <label class="layui-form-label">芝麻信用分</label>
        <div class="layui-input-inline">
            <input type="text" id="creditAdd" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">银行卡号</label>
        <div class="layui-input-inline">
            <input type="text" id="bankCardAdd" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">月薪</label>
        <div class="layui-input-inline">
            <input type="text" id="salaryAdd" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">公司</label>
        <div class="layui-input-inline">
            <input type="text" id="companyAdd" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">公司地址</label>
        <div class="layui-input-inline">
            <input type="text" id="companyAddressAdd" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">公司号码</label>
        <div class="layui-input-inline">
            <input type="text" id="companyPhoneAdd" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="insert">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<script type="text/html" id="customerBar">
    <a class="layui-btn layui-btn-mini" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="forbid">黑名单</a>
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
            url: '/customer/custom/list',
            page: true,
            cols: [[
                {field: 'id', title: 'ID', width: 70, sort: true},
                {field: 'customerName', title: '客户姓名', width: 100},
                {field: 'customerSex', title: '性别', width: 70, templet:'#sex'},
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
            if (obj.event === 'forbid') {
                layer.confirm('真的将该客户拉入黑名单吗', function (index) {
                    layer.close(index);
                    $.ajax({
                        type: 'POST',
                        url: '/customer/custom/forbid?id=' + data.id,
                        success: function (result) {
                            if (result === 'success') {
                                layer.msg("拉入黑名单成功!");
                                tableIns.reload();
                            } else {
                                layer.alert("拉入黑名单失败!");
                            }
                        },
                        error: function (e) {
                            layer.alert("error " + e);
                        }
                    })
                });
            } else if (obj.event === 'edit') {
                $("#id").val(data.id);
                $("#name").val(data.customerName);
                $("#customerSex").val(data.customerSex);
                $("#idCard").val(data.customerIdcard);
                $("#email").val(data.customerEmail);
                $("#phone").val(data.customerPhone);
                $("#address").val(data.customerAddress);
                $("#credit").val(data.customerCredit);
                $("#bankCard").val(data.customerCreditcard);
                $("#salary").val(data.customerSalary);
                $("#company").val(data.customerCompany);
                $("#companyAddress").val(data.companyAddress);
                $("#companyPhone").val(data.companyPhone);
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
                    var businessCustomerBo = {
                        id: parseInt($("#id").val()),
                        customerName: $("#name").val(),
                        customerSex: $("#customerSex").val(),
                        customerIdcard: $("#idCard").val(),
                        customerEmail: $("#email").val(),
                        customerPhone: $("#phone").val(),
                        customerAddress: $("#address").val(),
                        customerCredit: $("#credit").val(),
                        customerCreditcard: $("#bankCard").val(),
                        customerSalary: $("#salary").val(),
                        customerCompany: $("#company").val(),
                        companyAddress: $("#companyAddress").val(),
                        companyPhone: $("#companyPhone").val()
                    };
                    $.ajax({
                        type: 'POST',
                        url: '/customer/custom/update',
                        data: businessCustomerBo,
                        success: function (result) {
                            if (result === 'success') {
                                layer.msg("更新成功!");
                                obj.update({
                                    customerName: businessCustomerBo.customerName,
                                    customerSex: businessCustomerBo.customerSex,
                                    customerIdcard: businessCustomerBo.customerIdcard,
                                    customerEmail: businessCustomerBo.customerEmail,
                                    customerPhone: businessCustomerBo.customerPhone,
                                    customerAddress: businessCustomerBo.customerAddress,
                                    customerCredit: businessCustomerBo.customerCredit,
                                    customerCreditcard: businessCustomerBo.customerCreditcard,
                                    customerSalary: businessCustomerBo.customerSalary,
                                    customerCompany: businessCustomerBo.customerCompany,
                                    companyAddress: businessCustomerBo.companyAddress,
                                    companyPhone: businessCustomerBo.companyPhone
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
                var businessCustomerBo = {
                    customerName: $("#nameAdd").val(),
                    customerSex: $("#customerSexAdd").val(),
                    customerIdcard: $("#idCardAdd").val(),
                    customerEmail: $("#emailAdd").val(),
                    customerPhone: $("#phoneAdd").val(),
                    customerAddress: $("#addressAdd").val(),
                    customerCredit: $("#creditAdd").val(),
                    customerCreditcard: $("#bankCardAdd").val(),
                    customerSalary: $("#salaryAdd").val(),
                    customerCompany: $("#companyAdd").val(),
                    companyAddress: $("#companyAddressAdd").val(),
                    companyPhone: $("#companyPhoneAdd").val()
                };
                $.ajax({
                    type: 'POST',
                    url: '/customer/custom/insert',
                    data: businessCustomerBo,
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
            var name = $("#searchId").val();
            //执行重载
            tableIns.reload({
                // page: {
                //     curr: 1 //重新从第 1 页开始
                // },
                where:{
                    key:name
                }
            });
        })
    });
</script>
</body>
</html>
