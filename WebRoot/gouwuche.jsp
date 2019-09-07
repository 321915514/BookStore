<%@page import="com.bookstore.cart.domain.Cart"%>
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
	<meta http-equiv="description" content="This is my page">
        <meta name="author" content="order by dede58.com"/>
		<title>我的购物车</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
	<script src="./lib/jquery-1.12.4.js"></script>
		
	</head>
	<body>
	<!-- start header -->
	<!--end header -->

<!-- start banner_x -->
		<div class="banner_x center" style="">
			<a href="./index.html" target="_blank"></a>
			
			<div class="wdgwc fl ml40">我的购物车</div>
			<div class="wxts fl ml20">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</div>
			<div class="dlzc fr">
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
		<div class="xiantiao"></div>
		<div class="gwcxqbj">
			<div class="gwcxd center">
				<div class="top2 center">
					<div class="sub_top fl">
						<input type="checkbox" value="quanxuan" class="quanxuan" />全选
					</div>
					<div class="sub_top fl">商品名称</div>
					<div class="sub_top fl">单价</div>
					<div class="sub_top fl">数量</div>
					<div class="sub_top fl">小计</div>
					<div class="sub_top fr">操作</div>
					<div class="clear"></div>
				</div>
				
				<div class="contenner">
				<c:forEach items="${sessionScope.cart.cartItems}" var="item">
				<div class="content2 center" style="background: #fff">
					<div class="sub_content fl">
						<input type="checkbox" value="quanxuan" class="quanxuan" />
					</div>
					<div class="sub_content fl"><img src="./image/xm5-80.jpg"></div>
					<div class="sub_content fl ft20">${item.book.bname}</div>
					<div class="sub_content fl " id="price">${item.book.price}</div>
					<div class="sub_content fl">
						<div class="sub_content fl " id="price">${item.count}</div>
					</div>
					<script>
						$(document).ready(function(){
							$(".gwcxqbj.gwcxd center.top2 center.sub_top fl.quanxuan").click(function(){
								var checkval=$(this).prop("checked");
								console.log(checkval);
								$(".gwcxqbj.gwcxd center.contenner.content2 center.sub_content fl.quanxuan").prop("checked",checkval);
							
							});
						});
					
					
					</script>
					
					<div class="sub_content fl" id="xiaoji">${item.subTotal}</div>
					<div class="sub_content fl"><a href="<c:url value='/CartServlet?method=delete&bid=${item.book.bid}'/>">×</a></div>
					<div class="clear"></div>
				</div>
				</c:forEach>
			</div>
			</div>
		
		<div class="jiesuandan mt20 center">
				<div class="tishi fl ml20">
					<ul>
						<li><a href="./liebiao.html">继续购物</a></li>
						<li>|</li>
						<li>共<span></span>件商品，已选择<span></span>件</li>
					</ul>
				</div>
				<div class="jiesuan fr">
					<div class="jiesuanjiage fl">合计(不含运费):<span>${sessionScope.cart.total}元</span></div>
					<div class="jsanniu fr">
					<form action="<c:url value='OrderServlet'/>" method="post">
						<input type="hidden" name="method" value="add">
						<input class="jsan" type="submit" name="jiesuan"  value="去结算">
						</form>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			</div>
  
	<!--  footer-->
	<footer class="mt20 center"  style="width: 100%;height: 120px;line-height: 30px;text-align: center;font-size: 12px;background: rgb(250,250,250);padding:30px 0">			
			<div class="mt20">phil商城|<a href="http://www.baidu.com">百度搜索</a>|<a href="http://www.scuec.edu.cn">中南民大官网</a>|隐私政策|Select Region</div>
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
		</footer>

	</body>
</html>
