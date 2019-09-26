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
    
    <title>My JSP 'regist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<head>
        <meta name="author" content="order by dede58.com"/>
		<title>用户注册</title>
		<link rel="stylesheet" type="text/css" href="./css/login.css">
		<script type="text/javascript">
			function change(){
				var a=document.getElementById("image");
				a.src="/BookStore/Vcode?a="+new Date().getTime();
	}
	</script>

	</head>
	<body>
		<form  method="post" action="<c:url value='/UserServlet'/>">
			<input type="hidden" name="method" value="regist">
		<div class="regist">
			<div class="regist_center">
				<div class="regist_top">
					<div class="left fl">会员注册</div>
					<div class="right fr"><a href="<c:url value='/index.jsp'/>" target="_self">phil商城</a></div>
					<div class="clear"></div>
					<div class="xian center"></div>
				</div>
				<div class="regist_main center">
					<div><span style="color:red">${msg}</span></div>
					<div class="username">用&nbsp;&nbsp;户&nbsp;&nbsp;名:&nbsp;&nbsp;<input class="shurukuang" type="text" name="username" value="${form.username}" placeholder="请输入你的用户名"/><span style="color:red">${errors.username}</span></div>
					<div class="username">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;<input class="shurukuang" type="password" name="password" value="${form.password }" placeholder="请输入你的密码"/><span style="color:red">${errors.password}</span></div>
					<div class="username">确认密码:&nbsp;&nbsp;<input class="shurukuang" type="password" name="repassword" placeholder="请确认你的密码" value="${repassword}"/><span style="color:red">${errors.repassword}</span></div>
					<div class="username">邮&nbsp;&nbsp;&nbsp;&nbsp;箱:&nbsp;&nbsp;<input class="shurukuang" type="text" name="email" value="${form.email}" placeholder="请填写正确的邮箱"/><span style="color:red">${errors.email}</span></div>
					<div class="username">
						<div class="left fl">验&nbsp;&nbsp;证&nbsp;&nbsp;码:&nbsp;&nbsp;<input class="yanzhengma" type="text" name="vcode" placeholder="请输入验证码"/></div>
						<div class="right fl"><img src="<c:url value='/Vcode'/>" id="image"></div>
						<a href="javascript:change()" >换一张</a>
						<div><span style="color:red;margin-left:50px">${errors.vcode}</span></div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="regist_submit">
					<input class="submit" type="submit" name="submit" value="立即注册" >
				</div>
				
			</div>
		</div>
		</form>
	</body>
</html>

  
  
  
<%--   <body>
  <span style="color:red">${msg}</span>
  <form action="<c:url value='/UserServlet'/>" method="post">
    	<input type="hidden" name="method" value="regist"><br/>
    	<table>
    	<tr>
             <td>用户名:</td> <td><input type="text" value="${form.username}" name="username">
             <span style="color:red">${errors.username}</span></td>
        </tr>
    	<tr>
	    	<td>密码:</td>  <td><input type="password" value="${form.password }"  name="password">
	    	<span style="color:red">${errors.password}</span>
    	</td>
    	</tr>
    	<tr>
	    	<td>邮箱:</td>  <td><input type="text" name="email" value="${form.email}" >
	    	<span style="color:red">${errors.email}</span>
    	</td>
    	</tr>
    	<tr>
    		<td></td>
    		<td><input type="submit" value="注册" ></td>
    	</tr>
    	</table>
    	</form>
  </body>
</html> --%>