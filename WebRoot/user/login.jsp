<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

        <meta name="author" content="order by dede58.com"/>
		<title>会员登录</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/login.css'/>">
		
	</head>
	<body>
		<!-- login -->
		<div class="top center">
			<div class="logo center">
				<a href="<c:url value='/index.jsp'/>" target="_blank"><img src="./image/mistore_logo.png" alt=""></a>
			</div>
		</div>
		<form  method="post" action="<c:url value='/UserServlet'/>" class="form center">
			<input type="hidden" name="method" value="login">
		<div class="login">
			<div class="login_center">
				<div class="login_top">
					<div class="left fl">会员登录</div>
					<div class="right fr">您还不是我们的会员？<a href="./register.html" target="_self">立即注册</a></div>
					<div class="clear"></div>
					<div class="xian center"></div>
				</div>
				<div class="login_main center">
					<div style="font:20px Times New Roman;height: 20px;line-height: 20px;color:red;margin-left:50px">${msg}</div>
					<div class="username" style="margin-top:15px">用户名:&nbsp;<input  class="shurukuang" type="text" name="username" placeholder="请输入你的用户名" value="${form.username}"/>
					<div><span style="color:red;margin-left:50px">${errors.username }</span></div>
					</div>
					<div class="username">密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;<input class="shurukuang" type="password" name="password" placeholder="请输入你的密码" value="${form.password}"/>
					<div><span style="color:red;margin-left:50px">${errors.password }</span></div>
					</div>
					<div class="username">
						<div class="left fl">验证码:&nbsp;<input class="yanzhengma" type="text" name="username" placeholder="请输入验证码"/></div>
						<div class="right fl"><img src="./image/yanzhengma.jpg"></div>
						<div class="clear"></div>
					</div>
				</div>
				<div style="margin-top:0" class="login_submit">
					<input class="submit" type="submit" name="submit" value="立即登录" >
				</div>
				
			</div>
		</div>
		</form>
		<footer>
			<div class="copyright">简体 | 繁体 | English | 常见问题</div>
			<div class="copyright">小米公司版权所有-京ICP备10046444-<img src="./image/ghs.png" alt="">京公网安备11010802020134号-京ICP证110507号</div>

		</footer>
	</body>
</html>
