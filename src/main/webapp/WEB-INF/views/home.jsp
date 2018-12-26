<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="utf-8">
<title>后台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">

<link href="static/InsdepUI/insdep.easyui.min.css" rel="stylesheet" type="text/css">
<link href="static/InsdepUI/icon.css" rel="stylesheet" type="text/css">
<link href="static/css/home.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="static/InsdepUI/jquery.min.js"></script>
<script type="text/javascript" src="static/InsdepUI/jquery.easyui.min.js"></script>
<script type="text/javascript" src="static/InsdepUI/insdep.extend.min.js"></script>
<script type="text/javascript" src="static/js/home.js"></script>
</head>
<body style="width: 100%; height: 100%;">
	<div  class="easyui-layout" style="width: 100%; height: 100%;">
		<div data-options="region:'north'"
			style="width: 100%; height: 40px; background-color: rgb(32, 34, 42); border-bottom: 1px solid rgb(57, 61, 73);"
			border="false">
			<div style="width: 40%; height: 100%; float: left;">
				<img style="float: left; height: 26px; width: 26px; padding-left: 38px; padding-top: 7px"
					src="static/image/ice.png" alt="logo" />

				<p style="padding-left: 70px; padding-top: 5px; color: white; font-size: 20px; color: rgb(0, 125, 220); font-weight: 900;">
					<span>冷库数据管理平台</span>
				<p>
			</div>

			<div style="float: left; width: 40%; height: 100%; float: right; font-size: 14px;">
				<p style="float: right; padding-right: 20px; padding-top: 10px; color: #bfbfbf;">
					<span>用户</span>：${user_session.userName}&nbsp;&nbsp;|&nbsp;
					<span id="roleid" style="display:none">${user_session.userRole}</span> 
					<span>权限</span>：
						<c:choose>
						   <c:when test="${user_session.userRole > 2}">超级管理员</c:when>
						   <c:when test="${user_session.userRole > 1}">管理员 </c:when>
						   <c:otherwise>普通用户 </c:otherwise>
						</c:choose>
						&nbsp;&nbsp;|&nbsp;
					<a id="logout">退出登录</a>
				<p>
			</div>
		</div>
		<div id="myfooter" data-options="region:'south',split:false"
			style="height: 25px; background-color: rgb(57, 61, 73); text-align: center"
			border="false">Powered by 湖北省电子科学研究所有限公司</div>

		<div data-options="region:'west',split:false,iconCls:'icon-blank',"
			title="系统管理" style="width: 180px" border="false">
			<div id="accordion" class="easyui-accordion accordion-lists"
				style="width: 100%; height: 100%;" border="false">
				
				
				<div title="数据统计" data-options="iconCls:'icon-count'">
					<ul>
						<c:if test="${user_session.userRole > 1}">
							<li><a href="#" data="sys/admin/count.page" 
								class="easyui-linkbutton c1"
								data-options="plain:true,iconCls:'icon-adminsearch',toggle:true,group:'g1'"
								style="width: 100%; text-align: left; padding-left: 20px">统计查询</a>
							</li>
						</c:if>
						<li><a href="#" data="sys/user/count.page" 
							class="easyui-linkbutton c1"
							data-options="plain:true,iconCls:'icon-usersearch',toggle:true,group:'g1'"
							style="width: 100%; text-align: left; padding-left: 20px">用户记录查询</a>
						</li>
					</ul>
				</div>
				
				
				<div title="角色管理" data-options="iconCls:'icon-user_acl'">
					<ul>
						<c:if test="${user_session.userRole > 1}">
							<li><a href="#" data="sys/user/user.page" 
								class="easyui-linkbutton c1"
								data-options="plain:true,iconCls:'icon-user',toggle:true,group:'g1'"
								style="width: 100%; text-align: left; padding-left: 20px">用户角色管理</a>
							</li>
						</c:if>
						<li><a href="#" data="sys/user/userInfo.page" 
							class="easyui-linkbutton c1"
							data-options="plain:true,iconCls:'icon-password',toggle:true,group:'g1'"
							style="width: 100%; text-align: left; padding-left: 20px">个人信息管理</a>
						</li>
						<li><a href="#" data="sys/user/psd.page" 
							class="easyui-linkbutton c1"
							data-options="plain:true,iconCls:'icon-password',toggle:true,group:'g1'"
							style="width: 100%; text-align: left; padding-left: 20px">个人密码管理</a>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<div data-options="region:'center',iconCls:'icon-ok'" border="false"
			style="padding: 1px">
			<div id="tabs" class="easyui-tabs tabs-block  tab-color-blue   "
				data-options="plain:true,border:false"
				style="width: 100%; height: 100%">
				<div title="主页">
					<iframe src="welcome.page"
						style="width: 100%; height: 100%; border: none;" scrolling="no"></iframe>
				</div>
			</div>
		</div>
	</div>


	<div id="mm" class="easyui-menu" style="width: 150px;">
		<div id="mm-tabupdate">刷新</div>
		<div class="menu-sep"></div>
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseall">全部关闭</div>
		<div id="mm-tabcloseother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-tabcloseright">关闭当前右侧全部</div>
		<div id="mm-tabcloseleft">关闭当前左侧全部</div>
		<div class="menu-sep"></div>
		<div id="mm-exit">退出</div>
	</div>
</body>
</html>
