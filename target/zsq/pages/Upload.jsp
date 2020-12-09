<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/3/0003
  Time: 22:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>上传</title>
    <link rel="stylesheet" href="../layui/css/layui.css" media="all">
</head>
<body>
<div class="layui-form-item">
    <div class="layui-inline">
        <label class="layui-form-label">注册时间</label>
        <div class="layui-input-inline" style="width: 100px;">
            <input type="text" class="layui-input" id="test1">
        </div>
        <div class="layui-form-mid">至</div>
        <div class="layui-input-inline" style="width: 100px;">
            <input type="text" class="layui-input" id="test2">
        </div>
    </div>
</div>
<div class="layui-form-item">
    <div class="layui-inline">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline" style="width: 100px;">
            <input  type="text" name="title" required  lay-verify="required" placeholder="请输入名字" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid"></div>
        <div class="layui-input-inline" style="width: 100px;">
            <button type="button" class="layui-btn">查询</button>
        </div>
    </div>
</div>
<script>
layui.use([ 'table'], function() {
    table.render({
        elem: '#demo'
        ,height: 420
        ,url: '/demo/table/user/' //数据接口
        ,title: '用户表'
        ,page: true //开启分页
        ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
        ,totalRow: true //开启合计行
        ,cols: [[ //表头
            {type: 'checkbox', fixed: 'left'}
            ,{field: 'id', title: 'ID', width:80, sort: true, fixed: 'left', totalRowText: '合计：'}
            ,{field: 'username', title: '用户名', width:80}
            ,{field: 'experience', title: '积分', width: 90, sort: true, totalRow: true}
            ,{field: 'sex', title: '性别', width:80, sort: true}
            ,{field: 'score', title: '评分', width: 80, sort: true, totalRow: true}
            ,{field: 'city', title: '城市', width:150}
            ,{field: 'sign', title: '签名', width: 200}
            ,{field: 'classify', title: '职业', width: 100}
            ,{field: 'wealth', title: '财富', width: 135, sort: true, totalRow: true}
            ,{fixed: 'right', width: 165, align:'center', toolbar: '#barDemo'}
        ]]
    });
    })
</script>
</body>
<script src="../layui/layui.js"></script>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#test1', //指定元素
        });
    });
</script>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#test2', //指定元素
        });
    });
</script>
</html>
