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
</head>

<body class="container">
	<div class="line">
		<div class="x6 x3-move radius border border-main padding-large">
			<div class="line">
				<img src="images/login.jpg" height="200" /><img
					src="images/qcode.png" height="200" class="border " />
			</div>
			<div class="line">
				<h1 class="margin-large">全球眼资料管理平台</h1>
			</div>
			<form method="post" action="pcLogin.action">
				<div class="form-group">
					<div class="label">
						<label for="userId">账号</label>
					</div>
					<div class="field">
						<input type="text" class="input" id="userId" name="userId"
							size="30" placeholder="工号" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="password">密码</label>
					</div>
					<div class="field">
						<input type="password" class="input" id="password" name="password"
							size="30" placeholder="请输入密码" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="authCode">授权码</label>
						</div>
					<div class="field">
						<input type="text" class="input" id="authCode" name="authCode"
							size="30" placeholder="通过客户端获取的数字串" />
					</div>
				</div>
				<div class="form-button">
					<button class="button" type="submit">登录</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
