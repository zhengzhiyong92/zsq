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
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../layui/css/layui.css" media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<div class="demoTable">
    用户名：
    <div class="layui-inline">
        <input class="layui-input" name="username" id="demoReload" autocomplete="off">
    </div>
    <button class="layui-btn" data-type="reload">搜索</button>
</div>

<table class="layui-hide" id="LAY_table_user" lay-filter="user"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script src="../layui/layui.js"  charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<!--转换时间格式-->
<script type="text/javascript">
    function dateToStr(date) {
        var time = new Date(date.time);
        var y = time.getFullYear();
        var M = time.getMonth() + 1;
        M = M < 10 ? ("0" + M) : M;
        var d = time.getDate();
        d = d < 10 ? ("0" + d) : d;
        var h = time.getHours();
        h = h < 10 ? ("0" + h) : h;
        var m = time.getMinutes();
        m = m < 10 ? ("0" + m) : m;
        var s = time.getSeconds();
        s = s < 10 ? ("0" + s) : s;
        var str = y + "-" + M + "-" + d + " " + h + ":" + m + ":" + s;
        console.log(str);
        return str;
    }
</script>

<script>
    layui.use('table', function(){
        var table = layui.table;
        //方法级渲染
        table.render({
            elem: '#LAY_table_user'
            ,url: '/loginServlet?methodName=displayForm'
            ,cols: [[
                 {field:'username', title: '用户名', width:80}
                ,{field:'rgtime', title: '注册时间', width:120,templet:'<div>{{dateToStr(d.rgtime)}}</div>'}
                ,{field:'integral', title: '积分', sort: true,  width:80}
                ,{field:'uploadcount', title: '上传文档数', sort: true, width:120}
                ,{field:'downloadcount', title: '下载文档数', width:120}
                ,{field:'state', title: '用户状态',  width:120}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:160}
            ]]
            ,id: 'testReload'
            ,page: true
            ,height: 310
        });

        var $ = layui.$, active = {
            reload: function(){
                var demoReload = $('#demoReload');
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        // key: {
                        //     username: demoReload.val()
                        // }
                        keyword: demoReload.val()
                        // userName: '' ? '' : demoReload.val(),
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
</script>
</body>
</html>


