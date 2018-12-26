<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理-登陆</title>
    <link rel="stylesheet" href="static/css/layui.css">
    <style>
        html,body{
            height: 100%;
        }
        body {
            margin: 0;
            background-color: #e7e7e7;
            }

        input:-webkit-autofill {
        -webkit-box-shadow: inset 0 0 0 1000px #fff;
        background-color: transparent;

        }

        .admin-login-background {
        width: 310px;
        height: 250px;
        position: absolute;
        left: 83%;
        top: 50%;
        margin-left: -150px;
        margin-top: -125px;
        background-color: aliceblue;
        padding-left:10px;
        border-radius: 10px 10px 10px 10px;
        }

        .admin-header {
        width: 300px;
        height: 50px;
        }

        .admin-button {
        margin-top: 10px;
        }

        .admin-input {
        border-top-style: none;
        border-right-style: solid;
        border-bottom-style: solid;
        border-left-style: solid;
        height: 50px;
        width: 300px;
        padding-bottom: 0px;
        }


        .admin-input-username {
        border-top-style: solid;
        border-radius: 10px 10px 0 0;
        }

        .admin-input-verify {
        border-radius: 0 0 10px 10px;
        margin-bottom: 10px;
        }

        .admin-button {
        width: 300px;
        height: 50px;
        border-radius: 4px;
        background-color: #2d8cf0;
        }

        .admin-icon {
        margin-left: 260px;
        margin-top: 10px;
        font-size: 30px;
        }

        i {
        position: absolute;
        }

        .admin-captcha {
        position: absolute;
        margin-left: 205px;
        margin-top: -40px;
        }
    </style>
</head>
<body>
<div id="container" style="width:100%;height:480px;position: absolute; top: 50%;margin-top: -240px;background-image: url('static/image/bg.jpg')">
    <div class="admin-login-background"  >
        <div class="admin-header"  >
            
            <i class="layui-icon layui-icon-template-1" style="margin-left: 20px; margin-top: 10px; font-size: 30px;"></i>
            <a  href="register.page" style="float:right ;margin-right: 20px; margin-top: 15px; font-size: 16px;font-weight:800">用户注册</a>
        </div>
        
        <form class="layui-form" action="home.page" method="post">
            <div>
                <i class="layui-icon layui-icon-username admin-icon admin-icon-username"></i>
                <input  type="text" 
                        name="userName" 
                        placeholder="请输入用户名" 
                        required 
                        autocomplete="off"
                        class="layui-input admin-input admin-input-username">
            </div>
            
            <div>
                <i class="layui-icon layui-icon-password admin-icon admin-icon-password"></i>
                <input  
               		type="password" 
                    name="userPsd" 
                    required 
                    placeholder="请输入密码"
                    autocomplete="off"
                    class="layui-input admin-input admin-input-verify">
            </div>
            <span style="float:right;padding-right:30px"> ${msg} </span>
            <button class="layui-btn admin-button" >登陆</button>
        </form>
    </div>
</div>
<script src="static/js/layui.js"></script>
</body>
</html>
