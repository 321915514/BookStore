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
    
    <title>My JSP 'category.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

        <meta name="author" content="order by dede58.com"/>
		<title>列表</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
	</head>
	<body>
			<header>
			<div class="top center">
				<div class="left fl">
				</div>
				<div class="right fr">
					<div class="gouwuche fr"><a href="">购物车</a></div>
					<div class="fr">
								<c:choose>
								<c:when test="${ empty sessionScope.user }">
								<ul>
								<li><a href="<c:url value='/user/login.jsp'/>" target="_blank">登录</a></li>
								<li>|</li>
								<li><a href="<c:url value='/user/regist.jsp'/>" target="_blank">注册</a></li>
								<li>|</li>
								<li><a href="">消息通知</a></li>
								</ul>
								</c:when>
								<c:otherwise>
								<ul>
								<li><a href="#" target="_blank">你好,${sessionScope.user.username}</a></li>
								<li>|</li>
								<li><a href="<c:url value='/OrderServlet?method=myOrders'/>" target="_blank" >我的订单</a></li>
								<li>|</li>
								<li><a  href="<c:url value='/UserServlet?method=quit'/>" target="_parent">退出</a></li>
								</ul>
								</c:otherwise>
							</c:choose>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</header>
	<!--end header -->
	<!--end header -->

<!-- start banner_x -->
  	<div class="danpin center">
  		<div class="biaoti center">书</div>
  		<div>
			<div class="main center">
			<c:forEach items="${bookList}" var="list">
				<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
					<div class="sub_mingxing"><a href="<c:url value='/BookServlet?method=load&bid=${list.bid}'/>" target="_blank"><img src="./image/liebiao_hongmin4_dd.jpg" alt=""></a></div>
					<div class="pinpai"><a href="<c:url value='/desc.jsp'/>" target="_blank">${list.bname}</a></div>
					<div class="youhui">${list.author}</div>
					<div class="jiage">${list.price}元</div>
				</div>
			</c:forEach>
				<div class="clear"></div>
			</div>
		</div>
	</div>
		<!-- class="mt20 center"
		<footer class="mt20 center"  style="background: #f5f6f5;
    border-top: 1px solid #ebebeb;
    text-align: left;
    height: 42px;
    line-height: 42px;
    margin-top: 40px;
            ">			
			<div class="mt20">phil商城|<a href="http://www.baidu.com">百度搜索</a>|<a href="http://www.scuec.edu.cn">中南民大官网</a>|隐私政策|Select Region</div>
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
		</footer>
		</div> -->
  	 </body>
</html>
