<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>注册页</title>
    <link rel="stylesheet" href="static/css/layui.css">
    <link rel="stylesheet" href="static/css/style.css">
</head>
<body>

<div class="login-main">
    <header class="layui-elip">注册页</header>
    <form class="layui-form">
        <div class="layui-input-inline">
            <input type="text" name="account" required  lay-verify="required" placeholder="邮箱" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="text" name="account" required  lay-verify="required" placeholder="邮箱" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="text" name="account" required  lay-verify="required" placeholder="邮箱" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="text" name="account" required  lay-verify="required" placeholder="邮箱" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="text" name="account" required  lay-verify="required" placeholder="邮箱" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="text" name="account" required  lay-verify="required" placeholder="邮箱" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-input-inline ">
            <a style="width:100%" id="register"  class="layui-btn">注册</a>
        </div>
        <hr/>
        <p><a href="javascript:;" class="fl"></a><a href="javascript:;" class="fr">返回登录</a></p>
    </form>
</div>


<script src="static/js/layui.js"></script>
<script type="text/javascript">
    layui.use(['form'], function () {
        var form    = layui.form
            ,$      = layui.jquery;
        
		$("#register").onclick = function(){
			alert();
		}
    });
</script>
</body>
</html>