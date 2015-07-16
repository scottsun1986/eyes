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
			<strong>DVR详情</strong>
		</div>
<% Dvr currentDvr=(Dvr)request.getAttribute("currentDvr");
if(currentDvr!=null){
Cust currentCust=currentDvr.getCust();
%>
		<div style="margin-bottom:5px;margin:20px;">
			<table class="table table-bordered">
<tr>
					<th>接入点信息：</th><th></th>
				
				</tr>
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
			
			<table class="table table-bordered">
<tr>
					<th>DVR信息：</th>
				<th> </th>
				</tr>
				<tr>
					<td>平台类型：</td>
					<td><%=currentDvr.getPlatformType() %></td>
				</tr>
				<tr>
					<td>平台账号密码：</td>
					<td><%=currentDvr.getPlatformAccount() %></td>
				</tr>
				<tr>
					<td>PU名称：</td>
					<td><%=currentDvr.getPuName() %></td>
				</tr>
				<tr>
					<td>PU ID：</td>
					<td><%=currentDvr.getPuid() %></td>
				</tr>
				<tr>
					<td>宽带号：</td>
					<td><%=currentDvr.getBandNumber() %></td>
				</tr>
				<tr>
					<td>带宽：</td>
					<td><%=currentDvr.getBandSpeed() %></td>
				</tr>
				<tr>
					<td>接入模式：</td>
					<td><%=currentDvr.getBandMode() %></td>
				</tr>
				<tr>
					<td>承载设备：</td>
					<td><%=currentDvr.getBandDevice() %></td>
				</tr>
				<tr>
					<td>端口：</td>
					<td><%=currentDvr.getBandPort() %></td>
				</tr>
				<tr>
					<td>IP地址：</td>
					<td><%=currentDvr.getIp() %></td>
				</tr>
				<tr>
					<td>DVR:</td>
					<td><%=currentDvr.getDvr() %></td>
				</tr>
				<tr>
					<td>硬盘大小：</td>
					<td><%=currentDvr.getDiskSize() %></td>
				</tr>
				<tr>
					<td>硬盘品牌：</td>
					<td><%=currentDvr.getDiskType() %></td>
				</tr>
				<tr>
					<td>DVR位置：</td>
					<td><%=currentDvr.getDvrAddress() %></td>
				</tr>
				<tr>
					<td>摄像机型号：</td>
					<td><%=currentDvr.getCameraType() %></td>
				</tr>
				<tr>
					<td>摄像机数量：</td>
					<td><%=currentDvr.getCameraNum() %></td>
				</tr>
				<tr>
					<td>编码器通道描述：</td>
					<td><%=currentDvr.getCameraDesc() %></td>
				</tr>
				<tr>
					<td>摄像头至DVR距离：</td>
					<td><%=currentDvr.getCameraDvrLength() %></td>
				</tr>
				<tr>
					<td>产权归属：</td>
					<td><%=currentDvr.getPropertyRight() %></td>
				</tr>
				<tr>
					<td>照片：</td>
					<td></td>
				</tr>
				
			</table>
			<button class="button" onclick="closewindow()" >返回</button>
		</div>
<%} %>
	</div>

</body>
</html>
