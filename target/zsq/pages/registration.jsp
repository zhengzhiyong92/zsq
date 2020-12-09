<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/2/0002
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>注册页</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <link rel="stylesheet" href="../css/style.css">
    <!--    <link rel="icon" href="../frame/static/image/code.png">-->
</head>
<body>
<div class="login-main">
    <header class="layui-elip" style="width: 82%">注册页</header>
    <!-- 表单选项 -->
    <form class="layui-form">
        <div class="layui-input-inline">
            <!-- 用户名 -->
            <div class="layui-inline" style="width: 85%">
                <input type="text" id="user" name="account" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
            </div>
            <!-- 对号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="ri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <!-- 错号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="wr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
        <!-- 密码 -->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="password" id="pwd" name="password" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
            <!-- 对号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="pri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <!-- 错号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="pwr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
        <!-- 确认密码 -->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="password" id="rpwd" name="repassword" required  lay-verify="required" placeholder="请确认密码" autocomplete="off" class="layui-input">
            </div>
            <!-- 对号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="rpri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <!-- 错号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="rpwr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
        <!-- 手机号 -->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="text" id="tel" name="tel" required  lay-verify="required" placeholder="手机号" autocomplete="off" class="layui-input">
            </div>
        </div>
        <!-- Email -->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="text" id="email" name="email" required  lay-verify="required" placeholder="Email" autocomplete="off" class="layui-input">
            </div>
        </div>
        <!-- 学历 -->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <select  id="edu" name="edu" required  lay-verify="required" placeholder="学历" autocomplete="off" class="layui-input">
                    <option >请选择学历</option>
                    <option value="研究生">研究生</option>
                    <option value="本科">本科</option>
                    <option value="大专">大专</option>
                    <option value="高中">高中</option>
                    <option value="中专">中专</option>
                    <option value="技校">技校</option>
                </select>
            </div>
        </div>
        <!-- 职业 -->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%" >
                <select  id="ocu" name="ocu" required  lay-verify="required" placeholder="职业" autocomplete="off" class="layui-input">
                    <option >请选择职业</option>
                    <option value="司机">司机</option>
                    <option value="妇联代表">妇联代表</option>
                    <option value="掏粪工">掏粪工</option>
                    <option value="码农">码农</option>
                    <option value="性工作者">性工作者</option>
                </select>
            </div>
        </div>
        <!-- 性别 -->
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio"  name="sex" value="男" title="男" checked="">
                <input type="radio"  name="sex" value="女" title="女">
            </div>
        </div>

        <div class="layui-input-inline login-btn" style="width: 85%">
            <button type="submit" lay-submit lay-filter="sub" class="layui-btn">注册</button>
        </div>
        <hr style="width: 85%" />
        <p style="width: 85%"><a href="../pages/login.jsp" class="fl">已有账号？立即登录</a><a href="" class="fr">忘记密码？</a></p>
    </form>
</div>


<script src="../layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form','jquery','layer'], function () {
        var form   = layui.form;
        var $      = layui.jquery;
        var layer  = layui.layer;
        //添加表单失焦事件
        //验证表单
        $('#user').blur(function() {
            var user = $(this).val();
            $.ajax({
                url:"/loginServlet?methodName=check",
                type:'post',
                dataType:'text',
                data:{user:user},
                //验证用户名是否可用
                success:function(data){
                    if (data == "1") {
                        $('#wr').removeAttr('hidden');
                        $('#ri').attr('hidden','hidden');
                        layer.msg('当前用户名已被占用! ')
                    } else {
                        $('#ri').removeAttr('hidden');
                        $('#wr').attr('hidden','hidden');
                    }
                }
            })
        });
        // you code ...
        // 为密码添加正则验证
        $('#pwd').blur(function() {
            var reg = /^[\w]{6,12}$/;
            if(!($('#pwd').val().match(reg))){
                //layer.msg('请输入合法密码');
                $('#pwr').removeAttr('hidden');
                $('#pri').attr('hidden','hidden');
                layer.msg('请输入合法密码');
            }else {
                $('#pri').removeAttr('hidden');
                $('#pwr').attr('hidden','hidden');
            }
        });
        //验证两次密码是否一致
        $('#rpwd').blur(function() {
            if($('#pwd').val() != $('#rpwd').val()){
                $('#rpwr').removeAttr('hidden');
                $('#rpri').attr('hidden','hidden');
                layer.msg('两次输入密码不一致!');
            }else {
                $('#rpri').removeAttr('hidden');
                $('#rpwr').attr('hidden','hidden');
            };
        });
        //添加表单监听事件,提交注册信息
        form.on('submit(sub)', function(data) {
            var param=data.field;
            $.ajax({
                url:"/loginServlet?methodName=Registration",
                type:'post',
                dataType:'text',
                data: {params:JSON.stringify(param)},
                success:function(data){
                    if (data == 1) {
                        layer.msg('注册成功');
                    }
                }
            })
            //防止页面跳转
            return false;
        });
    });
</script>
</body>
</html>
