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
	$(function() {
$(".datepicker").datepicker({ dateFormat: 'yy-mm-dd'});//set dateFormat 

	
	});
	

	
	


function goToPage(page){
 document.userForm.action="searchByAll.action?currentPage="+page; 
  document.userForm.submit();  
}
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
			<strong>查询条件</strong>
		</div>

		<div style="margin-bottom:5px;margin:20px;">
			<s:form name="userForm" action="searchByAll.action">
				<div class="line-middle">
					<div class="xs12 xm4">
						<label class="label">关键字：</label>
						<s:textfield id="searchKey" name="searchKey" type="text"
							cssClass="input input-big  margin-small-bottom"
							placeholder="客户名称、地址、联系人、电话、平台账号、PU名称、IP、DVR位置、项目名称、备注等" />
					</div>
					<div class="xs12 xm4">
						<label class="label">客户使用状态：</label>

						<s:select cssClass="input input-big "
							list="#{'':'不限','在用':'在用','不在用':'不在用'}" headerKey="" id="status"
							name="status">

						</s:select>


					</div>
					<div class="xs12 xm4">
						<label class="label">所属区域：</label>

						<s:select cssClass="input input-big "
							list="#{'':'不限','玄武':'玄武','鼓楼':'鼓楼','秦淮':'秦淮','建邺':'建邺','雨花台':'雨花台','栖霞':'栖霞','化工园':'化工园'}" headerKey="" id="zone"
							name="zone">

						</s:select>


					</div>
				</div>
				<div class="line-middle">
					<div class="xs12 xm4">
						<label class="label">平台类型：</label>
						<s:select cssClass="input input-big "
							list="#{'':'不限','中兴':'中兴','柯达':'柯达','华为':'华为'}" headerKey=""
							id="platformType" name="platformType">

						</s:select>
					</div>
					<div class="xs12 xm4">
						<label class="label">PUID：</label>

						<s:textfield id="puid" name="puid" type="text"
							cssClass="input input-big  margin-small-bottom" />


					</div>
					<div class="xs12 xm4">
						<label class="label">宽带号：</label>

						<s:textfield id="bandNumber" name="bandNumber" type="text"
							cssClass="input input-big  margin-small-bottom" />

					</div>
				</div>
				<div class="line-middle">
					<div class="xs12 xm4">
						<label class="label">项目类型：</label>
						<s:select cssClass="input input-big "
							list="#{'':'不限','客户':'客户','代维':'代维','局内':'局内'}" headerKey=""
							id="type" name="type">

						</s:select>
					</div>
					<div class="xs12 xm4">
					<label class="label" >操作：</label>
						<button id="submitbtn" class="button  icon-search">查询</button>
						
<button id="addnewbtn" onclick="window.open('goToAddNewDvrPage.action')" class="button  icon-plus">添加</button>
						
					</div>
					<div class="xs12 xm4">
					 

					</div>
				</div>
			 
			</s:form>

		</div>
	</div>

	<div class="x12 border border-main radius panel table-responsive"
		style="margin-top:5px;">
		<div class="panel-head" style="margin-bottom:5px;">
			<strong>查询结果</strong>
		</div>

		<div    style="margin-bottom:5px;margin:20px;">
			<table class="table table-condensed table-striped table-bordered">
				<tr>
					<th>客户名称</th>
				 	<th>PU名称</th>
					<th>PU ID</th>
					<th>宽带号</th>
					<th>IP</th>
					<th>操作</th>
				</tr>

				<%
					List<Dvr> dvrList = (List<Dvr>) request.getAttribute("currentDvrs");
					if (dvrList != null) {
						Iterator<Dvr> it = dvrList.iterator();
						Dvr currentDvr;
						while (it.hasNext()) {
							currentDvr = it.next();
				%>
				<tr>
					<td><%=currentDvr.getCust().getName()%></td>
					<td><%=currentDvr.getPuName()%></td>
					<td><%=currentDvr.getPuid()%></td>
					<td><%=currentDvr.getBandNumber()%></td>
					<td><%=currentDvr.getIp()%></td>
					<td><button class="button button-little " onclick="window.open('gotoDvrDetailPage.action?id=<%=currentDvr.getId()%>')">详情</button>
					<button class="button button-little" onclick="window.open('gotoDvrModifyPage.action?id=<%=currentDvr.getId()%>')">修改</button>
					<button class="button button-little" onclick="window.open('gotoDvrDeletePage.action?id=<%=currentDvr.getId()%>')">删除</button></td>
				</tr>
				<%
					}
					}
				%>



			</table>
			<div class="margin-big-bottom">

					<%
						PageInfo pageInfo = (PageInfo) session.getAttribute("pageInfo");
						if (pageInfo != null) {
					%>
					<ul class="pagination pagination-group pagination-small">
						<li><button class="button"
								<%if (pageInfo.isIsFirstPage()) {%> disabled="disabled" <%}%>
								onclick="goToPage(1)">首页</button></li>
					
					
						<li><button   class="button"
								<%if (pageInfo.isIsFirstPage()) {%> disabled="disabled" <%}%>
								onclick="goToPage(<%=pageInfo.getPrePage()%>)">上一页</button></li>
					
						<li><button class="button "
								<%if (pageInfo.isIsLastPage()) {%> disabled="disabled" <%}%>
								onclick="goToPage(<%=pageInfo.getNextPage()%>)">下一页</button></li>
					
						<li><button class="button"
								<%if (pageInfo.isIsLastPage()) {%> disabled="disabled" <%}%>
								onclick="goToPage(<%=pageInfo.getPages()%>)">末页</button></li>
					</ul>
				
					共<%=pageInfo.getTotal()%>条记录,<%=pageInfo.getPages()%>页，当前第<%=pageInfo.getPageNum()%>页
					 
					<%
						}
					%>

				</div>
		</div>
		
	</div>

</body>
</html>
