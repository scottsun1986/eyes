<%@page import="util.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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




	<%
		ShowMsg showMsg = (ShowMsg) request.getAttribute("showMsg");
	%>
	<div class="line padding-top-large">
		<div class="x5 x3-move border padding-large border-main">
			<p class="bg-green-light">
			<h2><%=showMsg.getTitle()%></h2>

			</p>


			<hr class="bg-main" />
			<div class="margin-large"><%=showMsg.getContent()%></div>
			<hr class="bg-main" />
			<button class="button" <%if (showMsg.getSteps() == 0) {%>
				onclick="closewindow()" <%} else {%>
				onclick="history.go(<%=showMsg.getSteps()%>);" <%}%>>返回</button>


		</div>

	</div>




</body>
</html>

