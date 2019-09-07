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
    
    <title>My JSP 'list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  
    <table border="1" width="60%" align="center" cellspacing="0" >
    <c:forEach items="${orderList}" var="order">
  		<tr bgcolor="darkgray" bordercolor="aliceblue">
  			<td colspan="6">订单号:${order.oid}   订单时间${order.ordertime}   金额<font color="red"><b>${order.total}元</b></font>
  			<c:choose>
	  			<c:when test="${order.state eq 1 }">
	  			<a href="">等待付款</a>
	  			</c:when>
	  			<c:when test="${order.state eq 2 }">等待发货</c:when>
	  			<c:when test="${order.state eq 3 }">
	  			<a href="javascript:alert('已确认收货');">确认收货</a>
	  			</c:when>
	  			<c:when test="${order.state eq 4 }">交易成功</c:when>
  			</c:choose>
  			
  			</td>
  			
  		</tr>
  	
  	
  	<c:forEach items="${order.orderItemList}" var="list">
  		<tr bordercolor="gray" align="center">
  			<td>书名:${list.book.bname}</td>
  			<td>单价:${list.book.price}元</td>
  			<td>作者:${list.book.author}</td>
  			<td>数量:${list.count}</td>
  			<td>小计:${list.subtotal}元</td>
  		</tr>
  	</c:forEach>
 
  </c:forEach>
  </table>
   
   
   
   		<footer class="mt20 center" style="width: 100%;height: 120px;line-height: 30px;text-align: center;font-size: 12px;background: rgb(250,250,250);padding:30px 0" >			
			<div class="mt20">phil商城|<a href="http://www.baidu.com">百度搜索</a>|<a href="http://www.scuec.edu.cn">中南民大官网</a>|隐私政策|Select Region</div>
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
		</footer>
  </body>
</html>
