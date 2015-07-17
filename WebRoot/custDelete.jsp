<%@page import="mybatis.model.*"%>
<%@page import="mybatis.dao.*"%>
<%@page import="com.github.pagehelper.PageInfo"%>
<%@page import="util.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
<head>
<base href="<%=basePath%>">

<title>全球眼账号管理平台</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="js/pintuer/pintuer.css">
<link rel="stylesheet" href="js/jquery-ui.css">
<script src="js/jquery.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/pintuer/pintuer.js"></script>
<script src="js/respond.js"></script>
<script>
	 function closewindow() { window.opener = null; window.open('', '_self'); window.close(); } 
</script>
</head>

<body class="container">
<div class="navbar">
	   
	  <div class="navbar-body nav-navicon" id="navbar1">
	    <ul class="nav nav-inline nav-menu">
	      <li  class="active"><a href="goMainPage.action">DVR管理</a></li>
	      <li  ><a  href="goCustMainPage.action">客户接入点管理</a></li>
	     
	    </ul>
	    
	  </div>
	</div>
	<div class="x12 border border-main radius panel"
		style="margin-top:5px;">
		<div class="panel-head" style="margin-bottom:5px;">
			<strong>接入点详情</strong>
		</div>
<% Cust currentCust=(Cust)request.getAttribute("currentCust");
if(currentCust!=null){

%>
		<div style="margin-bottom:5px;margin:20px;">
			<table class="table table-bordered">
 
				<tr>
					<td>项目名称：</td>
					<td><%=currentCust.getOwner() %></td>
				</tr>
				<tr>
					<td>项目类型：</td>
					<td><%=currentCust.getType() %></td>
				</tr>
				<tr>
					<td>接入点客户名称：</td>
					<td><%=currentCust.getName() %></td>
				</tr>
				<tr>
					<td>接入点地址：</td>
					<td><%=currentCust.getAddress() %></td>
				</tr>
				<tr>
					<td>客户联系人(电话)：</td>
					<td><%=currentCust.getContact() %>/<%=currentCust.getContactPhone() %></td>
				</tr>
				<tr>
					<td>客户经理(电话)：</td>
					<td><%=currentCust.getCustMgr() %>/<%=currentCust.getCustMgrPhone() %></td>
				</tr>
				<tr>
					<td>接入点所在区域：</td>
					<td><%=currentCust.getZone() %></td>
				</tr>
				<tr>
					<td>接入点使用状态：</td>
					<td><%=currentCust.getStatus() %></td>
				</tr>
				
				
			</table>
			<p class="bg-yellow">重要提醒：删除接入点后，接入点下的所有DVR均会被自动删除！</p>
		 
			<button class="button" onclick="window.open('custDelete.action?id=<%=currentCust.getId()%>')" >确认删除</button><button class="button" onclick="closewindow()" >取消</button>
		
		</div>
<%} %>
	</div>

</body>
</html>
