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
					<div class="gouwuche fr"><a href="<c:url value='/gouwuche.jsp'/>">购物车</a></div>
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

<!-- start banner_x -->
		<div class="banner_x center" >
			<div style="text-align: left;>
				<h1  color: #000;
			    font-size: 38px;
			    font-style: italic;
			    text-decoration: none;
			    text-decoration-line: none;
			    text-decoration-style: initial;
			    text-decoration-color: initial;"
				><a href=""  style="color: #000;
									    font-size: 38px;
									    font-style: italic;
									    text-decoration: none;
									    text-decoration-line: none;
									    text-decoration-style: initial;
									    text-decoration-color: initial;">
						<span style="color: #FF5722;">G</span>rocery
						<span style="color: #FF5722;">S</span>hoppy
					</a>
			</h1>
				<div style="float:left">
				<a href=""><img style=" vertical-align: middle;  border: 0;
    border-top-color: initial;
    border-top-style: initial;
    border-top-width: 0px;
    border-right-color: initial;
    border-right-style: initial;
    border-right-width: 0px;
    border-bottom-color: initial;
    border-bottom-style: initial;
    border-bottom-width: 0px;
    border-left-color: initial;
    border-left-style: initial;
    border-left-width: 0px;
    border-image-source: initial;
    border-image-slice: initial;
    border-image-width: initial;
    border-image-outset: initial;
    border-image-repeat: initial;  " src="./image/logo2.png" alt=" "></a>
				</div>
				</div>
			<div class="nav fl">
				<ul>
					<%-- <li><a href="<c:url value='/BookServlet?method=findAll'/>" target="_blank">全部列表</a></li> --%>
				</ul>
			</div>
			<div class="search fr">
				<form action="" method="post">
					<div class="text fl">
						<input type="text" class="shuru"  placeholder="搜搜搜">
					</div>
					<div class="submit fl">
						<input type="submit" class="sousuo" value="搜索"/>
					</div>
					<div class="clear"></div>
				</form>
				<div class="clear"></div>
			</div>
		</div>
<!-- end banner_x -->

	

		<div class="sub_banner center">
			<div class="sidebar fl">
				<div class="fl"><a href=""><img src="./image/hjh_01.gif"></a></div>
				<div class="fl"><a href=""><img src="./image/hjh_02.gif"></a></div>
				<div class="fl"><a href=""><img src="./image/hjh_03.gif"></a></div>
				<div class="fl"><a href=""><img src="./image/hjh_04.gif"></a></div>
				<div class="fl"><a href=""><img src="./image/hjh_05.gif"></a></div>
				<div class="fl"><a href=""><img src="./image/hjh_06.gif"></a></div>
				<div class="clear"></div>
			</div>
			<div class="datu fl"><a href="<c:url value='/BookServlet?method=findAll'/>"><img src="./image/E836EF78-50C6-48FE-8640-3A73583E6EC6.JPG" alt=""></a></div>
			<div class="datu fl"><a href="<c:url value='/BookServlet?method=findAll'/>"><img src="./image/06356097-9AC1-4CF7-8779-A6B64D4FFF21.JPG" alt=""></a></div>
<!-- 			<div class="datu fr"><a href=""><img src="./image/pinghengche.jpg" alt=""></a></div> -->
			<div class="clear"></div>


		</div>
		<footer class="mt20 center"  style="width: 100%;height: 120px;line-height: 30px;text-align: center;font-size: 12px;background: rgb(250,250,250);padding:30px 0">			
			<div class="mt20">phil商城|<a href="http://www.baidu.com">百度搜索</a>|<a href="http://www.scuec.edu.cn">中南民大官网</a>|隐私政策|Select Region</div>
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
		</footer>
	</body>
</html>

