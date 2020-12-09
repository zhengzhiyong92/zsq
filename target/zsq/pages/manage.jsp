<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/2/0002
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>文档审核</title>
    <link rel="stylesheet" href="../layui/css/layui.css" media="all">
    <style>
        body{margin: 10px;}
        .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
    </style>
</head>
<body>
<div class="layui-form-item">
    <div class="layui-inline">
        <label class="layui-form-label">文档标题</label>
        <div class="layui-input-inline" >
            <input type="text" id="title" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">上传人</label>
        <div class="layui-input-inline" >
            <input type="text" id="name" name="name" required  lay-verify="required" placeholder="上传人姓名" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">文档类型</label>
        <div class="layui-input-inline" >
            <select  id="type" name="type" required  lay-verify="required" placeholder="Email" autocomplete="off" class="layui-input">
                <option value="">请选择文档类型</option>
                <option>研究生</option>
                <option>本科</option>
                <option>大专</option>
                <option>高中</option>
                <option>中专</option>
            </select>
        </div>
    </div>

</div>
<div class="layui-form-item">

    <div class="layui-inline">
        <label class="layui-form-label">注册时间</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input" id="test6" placeholder=" - ">
        </div>
        <div class="layui-input-inline" style="width: 100px;">
            <button type="button" class="layui-btn">查询</button>
        </div>
    </div>
</div>
<table class="layui-hide" id="demo" lay-filter="test"></table>
<script src="../layui/layui.js"></script>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        laydate.render({
            elem: '#test6'
            ,range: true
        });
    });
    layui.use([ 'table'], function(){
        var   table = layui.table //表格
        //执行一个 table 实例
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

        //监听头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id)
                ,data = checkStatus.data; //获取选中的数据
            switch(obj.event){
                case 'add':
                    layer.msg('添加');
                    break;
                case 'update':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else if(data.length > 1){
                        layer.msg('只能同时编辑一个');
                    } else {
                        layer.alert('编辑 [id]：'+ checkStatus.data[0].id);
                    }
                    break;
                case 'delete':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else {
                        layer.msg('删除');
                    }
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                layer.msg('查看操作');
            } else if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                });
            } else if(layEvent === 'edit'){
                layer.msg('编辑操作');
            }
        });
    });
</script>
</body>

</html>
