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

<link rel="stylesheet" href="js/jquery-ui.css">

<link rel="stylesheet" href="js/pintuer/pintuer.css">

<script src="js/jquery.js"></script>
<script src="js/jquery-ui.js"></script>




<script src="js/pintuer/pintuer.js"></script>
<script src="js/respond.js"></script>


</head>

<body class="container">
<div class="navbar">
	   
	  <div class="navbar-body nav-navicon" id="navbar1">
	    <ul class="nav nav-inline nav-menu">
	      <li><a href="goMainPage.action">DVR管理</a></li>
	      <li  class="active" ><a  href="goCustMainPage.action">客户接入点管理</a></li>
	     
	    </ul>
	    
	  </div>
	</div>
	<div class="x12 border border-main radius panel"
		style="margin-top:5px;">
		<div class="panel-head" style="margin-bottom:5px;">
			<strong>修改客户接入点</strong>
		</div>

		<div style="margin-bottom:5px;margin:20px;">
			<s:form name="userForm" method="post" class="form-x"
				action="modifyCust.action">


				<div class="form-group">
					<div class="label" >
						<label for="username">项目名称</label>
					</div>
					<div class="field">
						 
						<s:textfield id="owner" name="currentCust.owner" type="text"
							cssClass="input input-big"  data-validate="required:不为空" placeholder="该接入点的客户名称，如南京电信、紫燕百味鸡" 
							 />
						<s:hidden id="id" name="currentCust.id"></s:hidden>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="type">项目类型</label>
					</div>
					<div class="field">
							<s:select cssClass="input input-big " 
							list="#{'客户':'客户','局内':'局内','代维':'代维','其它':'其它'}"
							headerKey="" id="type" name="currentCust.type">

						</s:select>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="username">接入点名称</label>
					</div>
					<div class="field">
						<s:textfield id="name" name="currentCust.name" type="text"
							cssClass="input input-big"  data-validate="required:不为空"  placeholder="具体接入点，如：大钟桥店" 
							 />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="address">地址</label>
					</div>
					<div class="field">
							<s:textfield id="address" name="currentCust.address" type="text"
							cssClass="input input-big"   placeholder="接入点地址" 
							 />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="contact">客户联系人</label>
					</div>
					<div class="field">
						<s:textfield id="contact" name="currentCust.contact" type="text"
							cssClass="input input-big"
							 />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="contactPhone">联系人电话</label>
					</div>
					<div class="field">
						<s:textfield id="contactPhone" name="currentCust.contactPhone" type="text"
							cssClass="input input-big"
							 />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="custMgr">客户经理</label>
					</div>
					<div class="field">
						<s:textfield id="custMgr" name="currentCust.custMgr" type="text"
							cssClass="input input-big"
							 />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="custMgrPhone">客户经理电话</label>
					</div>
					<div class="field">
						<s:textfield id="custMgrPhone" name="currentCust.custMgrPhone" type="text"
							cssClass="input input-big"
							 />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="username">所属区域</label>
					</div>
					<div class="field">
						<s:select cssClass="input input-big "
							list="#{'玄武':'玄武','鼓楼':'鼓楼','秦淮':'秦淮','建邺':'建邺','雨花台':'雨花台','栖霞':'栖霞','化工园':'化工园'}" headerKey="" id="zone"
							name="currentCust.zone">

						</s:select>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="status">客户使用状态</label>
					</div>
					<div class="field">
						<s:select cssClass="input input-big " 
							list="#{'在用':'在用','不在用':'不在用','其它':'其它'}"
							headerKey="" id="status" name="currentCust.status">

						</s:select>
					</div>
				</div>
				
				<button id="submitbtn" class="button  icon-plus">保存</button>
			</s:form>

		</div>
	</div>

	

</body>



</html>
