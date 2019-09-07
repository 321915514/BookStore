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
    
    <title>My JSP 'xiangqing.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
        <meta name="author" content="order by dede58.com"/>
		<title>详情</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
	</head>
	<body>
	<!-- start header -->
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

	<form action="<c:url value='CartServlet'/>" method="post">
	<div class="jieshao mt20 w">
		<div class="right fr">
			<div class="h3 ml20 mt20">${book.bname}</div>
			<div class="jiage ml20 mt10">${book.price}元</div>
			</div>
			<div class="xqxq mt20 ml20">
				<div class="top1 mt10">
					<div class="left1 fl">${book.bname}</div>
					<div class="right1 fr">${book.price}元</div>
					<div class="clear"></div>
				</div>
				<%-- <div class="bot mt20 ft20 ftbc">总计:${book.price}元</div> --%>
			</div>
			<div class="xiadan ml20 mt20">
					<input type="hidden" name="method" value="add">
					<div>数量:<input class="shuliang" type="number" name="count" value="1" step="1" min="1" /></div>
					<input class="jrgwc"  type="submit" value="立即选购" />
					<input class="jrgwc" type="submit"  value="加入购物车" />
					<input type="hidden" name="bid" value="${book.bid}">
			</div>
			
		</div>
		<div class="clear"></div>
	</form>
	<!-- footer -->
	<footer class="mt20 center"  style="width: 100%;height: 120px;line-height: 30px;text-align: center;font-size: 12px;background: rgb(250,250,250);padding:30px 0">			
			<div class="mt20">phil商城|<a href="http://www.baidu.com">百度搜索</a>|<a href="http://www.scuec.edu.cn">中南民大官网</a>|隐私政策|Select Region</div>
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
		</footer>

	</body>
</html>
