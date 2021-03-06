<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>user</title>
<link href="../../static/InsdepUI/insdep.easyui.min.css" rel="stylesheet" type="text/css">
<link href="../../static/InsdepUI/icon.css" rel="stylesheet" type="text/css">
<link href="../../static/css/user.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../static/js/user.js"></script>
<script type="text/javascript" src="../../static/InsdepUI/jquery.min.js"></script>
<script type="text/javascript" src="../../static/InsdepUI/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../static/InsdepUI/insdep.extend.min.js"></script>
</head>
<body style="width:100%;height:100%">
<!-- --------------------主页面 -------------------------------- -->
	<div id="data">
		<table class="easyui-datagrid" id="dg" title="用户管理" style="width:100%;height:100%;padding:0px;margin:0px"
		 data-options="
				rownumbers:true,
				url:'../../sys/user/selectAllUser.json',
				autoRowHeight:false,
				pagination:true,
				pageSize:10,
				pageList:[10,20,30,40,50,100,200],
				fitColumns:true,
				autoRowHeight: false, 
				toolbar:'#tb'">
			<thead>
				<tr>
					<th field="userId" checkbox=true   align="center">ID</th>
					<th field="userName" width="40" align="center">用户名</th>
					<th field="userCode" width="50" align="center">用户编码</th>
					<th field="userRole" width="60" align="center" formatter="toRole">用户角色</th>
					<th field="userCompany" width="150" align="center">用户单位</th>
					<th field="userAddress" width="80" align="center" formatter="toAddress">用户地址</th>
					<th field="userCreateTime" width="100" align="center" formatter="dateFormatter ">创建时间</th>
					<th field="opera" width="60" align="center" formatter="opera">操作</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="tb" style="padding:0px;height:auto">
		<div style="padding-left: 12px">
			<a href="#" class="easyui-linkbutton" iconCls="icon-newadduser" onclick="openAddUserDialog()" plain="true"></a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-newdelete" onclick="deleteListUser()" plain="true"></a>
			<input id="searchbox" class="easyui-searchbox" style="width:250px" 
				data-options="searcher:searcher,prompt:'请输入要搜索的值',menu:'#searchboxmenu'"></input> 
			<div id="searchboxmenu" style="width:100px"> 
				<div data-options="name:'userName'">用户名</div> 
				<div data-options="name:'userCode'">用户编码</div>
			</div>
			<a href="#" class="easyui-linkbutton" plain="true" >|</a>
			<select id="searchByAddress" class="easyui-combobox" name="userAddress" editable="false"
								style="width:120px;height:32px;" 
								url="../../sys/user/getCity.json" valueField="id" textField="name">
								</select>
			<a href="#" class="easyui-linkbutton" plain="true" style="color:rgb(0,125,220)" onclick="searchByAddress()">省份查询</a>
			<a href="#" class="easyui-linkbutton" plain="true" >|</a>
			<select id="searchByRole" class="easyui-combobox" name="userAddress" editable="false"style="width:120px;height:32px;" >
				<option value="2">管理员</option>
				<option value="1">普通用户</option>
			</select>
			<a href="#" class="easyui-linkbutton" plain="true" style="color:rgb(0,125,220)" onclick="searchByRole()">角色查询</a>
			<a href="#" class="easyui-linkbutton" plain="true" >|</a>
			<a href="#" class="easyui-linkbutton" plain="true" style="color:rgb(0,125,220)" onclick="reloaddata()">重置数据</a>
			
			<a href="#" class="easyui-linkbutton" plain="true" style="color:rgb(0,125,220)" onclick="CreateFormPage('打印测试', $('#dg'));">打印</a>
		</div>
	</div>
<!-- --------------------编辑页面 -------------------------------- -->
	<div id="dlg" class="easyui-dialog" title="编辑用户" style="width:300px;height:380px;padding:10px" data-options="
				iconCls: 'icon-newedit',
				modal:true,
				closed:true,
				buttons: [{
					text:'保存',
					iconCls:'icon-newadd',
					handler:function(){
						editUser();
					}
				},{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function(){
						$('#dlg').dialog('close');
					}
				}]
			">
		<form id="dlg_f"  method="post" style="padding-left:5px;padding-top:10px">
			<table  style="font-size:10px;">
				<tr>
					<td>用户ID:</td>
					<td><input id="dialog_userId" class="easyui-textbox" type="text" name="userId" style="width:200px;height:32px;"></input></td>
				</tr>
				<tr>
					<td>用户名:</td>
					<td><input id="dialog_userName" class="easyui-textbox" type="text" name="userName" style="width:200px;height:32px;"></input></td>
				</tr>
				<tr>
					<td>用户编码:</td>
					<td><input id="dialog_userCode" class="easyui-textbox" type="text" name="userCode" style="width:200px;height:32px;"></input></td>
				</tr>
				<tr>
					<td>用户角色:</td>
					<td><input id="dialog_userRole" class="easyui-textbox" type="text" name="nouserRole" style="width:200px;height:32px;"></input></td>
				</tr>
				<tr>
					<td>用户单位:</td>
					<td><input id="dialog_userCompany" class="easyui-textbox" type="text" name="userCompany" style="width:200px;height:32px;"></input></td>
				</tr>
				<tr>
					<td>用户地址:</td>
					<td>
						<select id="dialog_userAddress" class="easyui-combobox" name="userAddress" editable="false"
								style="width:200px;height:32px;" 
								url="../../sys/user/getCity.json" valueField="id" textField="name"></select>
					</td>
				</tr>
				<tr>
					<td>创建时间:</td>
					<td><input id="dialog_userCreateTime" class="easyui-textbox" type="text" name="nouserCreateTime" style="width:200px;height:32px;"></input></td>
				</tr>
			</table>
		</form>
	</div>
<!-- --------------------添加页面 -------------------------------- -->
	<div id="add_dlg" class="easyui-dialog" title="添加用户" style="width:300px;height:420px;padding:10px" data-options="
				iconCls: 'icon-newedit',
				modal:true,
				closed:true,
				buttons: [{
					text:'添加',
					iconCls:'icon-newadd',
					handler:function(){
					addUser();
					
					}
				},{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function(){
						$('#add_dlg').dialog('close');
					}
				}]
			">
		<form id="add_dlg_f" method="post" style="padding-left:5px;padding-top:10px">
			<table  style="font-size:10px;">
				<tr >
					<td colspan=2>
						<div class="alert-warning">
						  <b>提示：</b><br/>用户编码将在添加成功后展示！
						</div>
					</td>
				</tr>
				<tr>
					<td colspan=2>
						   
					</td>
				</tr>
				<tr>
					<td>用户名:</td>
					<td><input id="add_dialog_userName" data-options="required:true" class="easyui-textbox" type="text" name="userName" style="width:200px;height:32px;"></input></td>
				</tr>
				<tr>
					<td>用户密码:</td>
					<td><input id="add_dialog_userPsd" data-options="required:true" class="easyui-textbox" type="text" name="userPsd" style="width:200px;height:32px;"></input></td>
				</tr>
				<tr>
					<td>重复密码:</td>
					<td><input id="readd_dialog_userPsd" data-options="required:true" class="easyui-textbox" type="text" name="reuserPsd" style="width:200px;height:32px;"></input></td>
				</tr>
				<tr>
					<td>用户角色:</td>
					<td>
						<select id="add_dialog_userRole" class="easyui-combobox" name="userRole" style="width:200px;height:32px;"   editable="false">
							<option value="2">管理员</option>
							<option value="1">普通用户</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>用户单位:</td>
					<td><input id="add_dialog_userCompany" data-options="required:true" class="easyui-textbox" type="text" name="userCompany" style="width:200px;height:32px;"></input></td>
				</tr>
				<tr>
					<td>用户地址:</td>
					<td>
						<select id="add_dialog_userAddress" class="easyui-combobox" name="userAddress"  editable="false"
						style="width:200px;height:32px;" 
								url="../../sys/user/getCity.json" valueField="id" textField="name"></select>
					</td>
				</tr>
			</table>
		</form>
		
	</div>
</body>
</html>
