<%--
  Created by IntelliJ IDEA.
  User: ln
  Date: 2018/3/26
  Time: 17:42
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
    <link rel="stylesheet" href="<%=basePath%>frame/static/css/style.css">
</head>
<body class="body">
<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
<div id="main-line" style="width: 100%;height:400px;"></div>

<div id="main-bing" style="width: 100%;height:400px;"></div>

<script src="<%=basePath%>frame/layui/layui.js"></script>
<script src="<%=basePath%>frame/echarts/echarts.min.js"></script>
<script type="text/javascript">

    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main-line'));

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption({
        title: {
            text: '贷款申请总额'
        },
        tooltip: {},
        legend: {
            data: ['总额(万)']
        },
        xAxis: {
            data: ["2017/10", "2017/11", "2017/12", "2018/01", "2018/02", "2018/03"]
        },
        yAxis: {},
        series: [{
            name: '总额(万)',
            type: 'bar',
            data: [50, 200, 360, 450, 500, 570]
        }]
    });

    // 基于准备好的dom，初始化echarts实例
    var chart = echarts.init(document.getElementById('main-bing'));

    // 配置
    chart.setOption({
        title: {
            text: '贷款类型',
            x: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: ['个人日常消费', '装修', '旅游', '教育', '医疗']
        },
        series: [
            {
                name: '贷款类型',
                type: 'pie',
                radius: '55%',
                data: [
                    {value: 400, name: '个人日常消费'},
                    {value: 335, name: '装修'},
                    {value: 310, name: '旅游'},
                    {value: 274, name: '教育'},
                    {value: 235, name: '医疗'}
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    });

    layui.use(['element'], function () {
        var element = layui.element
            , $ = layui.jquery;

        // you code ...


    });
</script>
</body>
</html>
