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
      
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
        <meta name="author" content="order by dede58.com"/>
		<title>phil商城</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
		<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
		<script>			  

		  
		
		</script>
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
  
  
  <body>
  
  
  
  <table border="1" width="60%"  align="center" cellspacing="0" bgcolor="write">
  		<tr bgcolor="darkgray" bordercolor="gray">
  			<td colspan="6">订单号:${order.oid}   订单时间${order.ordertime}   金额<font color="red"><b>${order.total}元</b></font>  <a href=""  style="color:red">去付款</a></td>
  		</tr>
  	<c:forEach items="${order.orderItemList}" var="list">
  		<tr bordercolor="gray" align="center" bgcolor="darkgray" bordercolor="gray">
  			<td>书名:${list.book.bname}</td>
  			<td>单价:${list.book.price}元</td>
  			<td>作者:${list.book.author}</td>
  			<td>数量:${list.count}</td>
  			<td>小计:${list.subtotal}元</td>
  		</tr>
  	</c:forEach>
  </table>
	<footer class="mt20 center"  style="width: 100%;height: 120px;line-height: 30px;text-align: center;font-size: 12px;background: rgb(250,250,250);padding:30px 0">			
			<div class="mt20">phil商城|<a href="http://www.baidu.com">百度搜索</a>|<a href="http://www.scuec.edu.cn">中南民大官网</a>|隐私政策|Select Region</div>
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
		</footer>
  </body>
</html>
