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
<link rel="stylesheet" href="js/ui-dialog.css">
<link rel="stylesheet" href="js/pintuer/pintuer.css">
<script src="js/jquery.js"></script>
<script src="js/jquery-ui.js"></script>



<script src="js/dialog-min.js"></script>
<script src="js/pintuer/pintuer.js"></script>
<script src="js/respond.js"></script>
<script>

   var d;
//	$(function() {
		
		
		
		
		


//	});
	
	function getCusts(){
	 
	
	 $.getJSON("findCustsList.action",
	  {custsKey:$('#custsKey').val()},
	   function(json){
        	$('#custsResult').empty();
        	
        	$('#confirmButton').attr("disabled","disabled");
     
       	if(json.custList.length!=0){//说明有返回值
       	var custList=json.custList;
       	for (var i = 0; i < custList.length; i++) {
       	$('#custsResult').prepend("<tr  ><td style='display:none'>"+custList[i].id+"</td><td>"+custList[i].owner+"</td><td>"+custList[i].name+"</td><td>"+custList[i].address+"</td><td>"+custList[i].contact+"</td>	<td>"+custList[i].contact_phone+"</td></tr>"); 
       	}
       	
       	}else{
       		$('#custsResult').prepend("无结果"); 
       
       	}
  
 
  
  				//以下这段是变色用的、
  			   var dtSelector = ".table"; 
               var tbList = $(dtSelector); 
			 
				tbList.each(function() { 
				var self = this; 
				 		
				// 选择行变色 
				$("tr", $(self)).click(function (){ 
				var trThis = this; 
				$(self).find(".red").removeClass('red'); 
				if ($(trThis).get(0) == $("tr:first", $(self)).get(0)){ 
				return; 
				} 
				$(trThis).addClass('red'); 
				   $('#confirmButton').removeAttr("disabled");	
			
				}); 
				}); 
      }
     );
  //$("#myDiv").html(htmlobj.responseText);
   
	}
	
    function confirmCust(){
    
   $('#custId').val($('#custsResult').find(".red").find("td:first").text());
    $('#username').val($('#custsResult').find(".red").find("td:first").next().next().text());
  d.close();
    }
    
    
    function openChooseDialog(){
    	d = dialog({
			title : '选择用户信息',
			align : 'top',
			content : document.getElementById('chooseCustDiv')
		});
		d.show(document.getElementById('usernamediv'));
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
			<strong>修改监控点</strong>
		</div>

		<div style="margin-bottom:5px;margin:20px;">
			<s:form name="userForm" method="post" class="form-x"
				action="modifyDvr.action">


				<div class="form-group">
					<div class="label" id="usernamediv">
						<label for="username" id="usernamediv">客户接入点</label>
					</div>
					<div class="field">
						<s:textfield  type="text" cssClass="input input-big" id="username" name="currentDvr.cust.name"  data-validate="required:不为空"
							size="20"  onclick="openChooseDialog()"   placeholder="点击输入框选择用户接入点" />
					
						<s:hidden id="custId" name="currentDvr.custId"/>
						<s:hidden id="id" name="currentDvr.id"/>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="username">PU名称</label>
					</div>
					<div class="field">
							<s:textfield id="puName" name="currentDvr.puName" type="text"
							cssClass="input input-big" placeholder="如:龙江营业厅1" 
							 />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="username">PU ID</label>
					</div>
					<div class="field">
						<s:textfield id="puid" name="currentDvr.puid" type="text"
							cssClass="input input-big"
							 />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="username">平台类型</label>
					</div>
					<div class="field">
						<s:select cssClass="input input-big " 
							list="#{'中兴':'中兴','柯达':'柯达','华为':'华为','其它':'其它'}"
							headerKey="" id="platformType" name="currentDvr.platformType">

						</s:select>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="username">平台账号</label>
					</div>
					<div class="field">
						<s:textfield id="platformAccount" name="currentDvr.platformAccount" type="text"
							cssClass="input input-big"
							 />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="username">宽带号</label>
					</div>
					<div class="field">
						<s:textfield id="bandNumber" name="currentDvr.bandNumber" type="text"
							cssClass="input input-big"
							 />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="username">宽带速率</label>
					</div>
					<div class="field">
						<s:textfield id="bandSpeed" name="currentDvr.bandSpeed" type="text"
							cssClass="input input-big"  placeholder="如:10M" 
							 />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="username">接入模式</label>
					</div>
					<div class="field">
						<s:select cssClass="input input-big " 
							list="#{'EPON':'EPON','LAN':'LAN','ADSL':'ADSL','其它':'其它'}"
							headerKey="" id="bandMode" name="currentDvr.bandMode">

						</s:select>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="username">接入设备</label>
					</div>
					<div class="field">
						<s:textfield id="bandDevice" name="currentDvr.bandDevice" type="text"
							cssClass="input input-big"  placeholder="如:光猫，F821" 
							 />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="username">设备端口</label>
					</div>
					<div class="field">
						<s:textfield id="bandPort" name="currentDvr.bandPort" type="text"
							cssClass="input input-big"  placeholder="如:5口" 
							 />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="username">IP地址</label>
					</div>
					<div class="field">
						<s:textfield id="ip" name="currentDvr.ip" type="text"
							cssClass="input input-big"  placeholder="如:218.2.132.12/24/132.11" 
							 />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="username">DVR型号</label>
					</div>
					<div class="field">
						<s:textfield id="dvr" name="currentDvr.dvr" type="text"
							cssClass="input input-big"  placeholder="如:DS-8008HE-S" 
							 />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="username">硬盘大小</label>
					</div>
					<div class="field">
						<s:textfield id="diskSize" name="currentDvr.diskSize" type="text"
							cssClass="input input-big"  placeholder="如:2*1T" 
							 />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="username">硬盘品牌</label>
					</div>
					<div class="field">
						<s:textfield id="diskType" name="currentDvr.diskType" type="text"
							cssClass="input input-big"  placeholder="如:西部数据" 
							 />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="username">DVR位置</label>
					</div>
					<div class="field">
						<s:textfield id="dvrAddress" name="currentDvr.dvrAddress" type="text"
							cssClass="input input-big"  placeholder="DVR的安装位置描述" 
							 />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="username">摄像头类型</label>
					</div>
					<div class="field">
						<s:textfield id="cameraType" name="currentDvr.cameraType" type="text"
							cssClass="input input-big"  placeholder="如：三个海康半球，一个三星枪机" 
							 />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="username">摄像头数量</label>
					</div>
					<div class="field">
						<s:textfield id="cameraNum" data-validate="plusinteger:请输入数字" name="currentDvr.cameraNum" type="text"
							cssClass="input input-big"  placeholder="如：3个" 
							 />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="username">摄像头说明</label>
					</div>
					<div class="field">
						<s:textfield id="cameraDesc" name="currentDvr.cameraDesc" type="text"
							cssClass="input input-big"  placeholder="如：1通道-业务受理台左上角摄像头，2通道。。。" 
							 />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="username">距离</label>
					</div>
					<div class="field">
						<s:textfield id="cameraDvrLength" name="currentDvr.cameraDvrLength" type="text"
							cssClass="input input-big"  placeholder="摄像头至DVR的线的距离" 
							 />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="username">产权</label>
					</div>
					<div class="field">
						<s:select cssClass="input input-big " 
							list="#{'租用':'租用','自备':'自备','赠送 ':'赠送','其它':'其它'}"
							headerKey="" id="propertyRight" name="currentDvr.propertyRight">

						</s:select>
					</div>
				</div>
				<button id="submitbtn" class="button  icon-plus">保存</button>
			</s:form>

		</div>
	</div>

	<div id="chooseCustDiv" style="display:none">
		 
			<table  class="table">
				<tr>
					<td>关键字：</td>
					<td><input type="text" class="input"  id="custsKey"/></td>
					<td><button class="button" onclick="getCusts()">搜索</button></td>
					<td><button class="button" onclick="window.open('gotoAddNewCust.action')">新增</button></td>
					<td><button class="button bg-red" id="confirmButton" onclick="confirmCust()" >确定选择行</button></td>
				</tr>
			</table>
<table class="table">
				<thead>
					<tr>
					<td>项目</td>
					<td>用户名称</td>
					<td>地址</td>
					<td>客户联系人</td>
					<td>联系人电话</td>
					</tr>
				</thead>
				<tbody id="custsResult">
				
				</tbody>
			</table>

		 
	</div>

</body>



</html>
