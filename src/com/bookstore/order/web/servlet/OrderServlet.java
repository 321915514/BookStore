package com.bookstore.order.web.servlet;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.cart.domain.Cart;
import com.bookstore.cart.domain.CartItem;
import com.bookstore.order.domain.Order;
import com.bookstore.order.domain.OrderItem;
import com.bookstore.order.service.OrderService;
import com.bookstore.user.domain.User;

import servlet.BaseServlet;
import utils.CommonUtils;

public class OrderServlet extends BaseServlet{
	private OrderService orderService=new OrderService();
	public String add(HttpServletRequest request , HttpServletResponse response) throws Exception {
		Cart cart=(Cart) request.getSession().getAttribute("cart");
		Order order = new Order();
		order.setOid(CommonUtils.UUID());
		order.setOrdertime(new Date());
		order.setState(1);
		User user =(User) request.getSession().getAttribute("user");
		order.setOwner(user);
		order.setTotal(cart.getTotal());
		
		
		//创建订单条目
		List<OrderItem> orderItem=new ArrayList<OrderItem>();
		for (CartItem cartItem : cart.getCartItems()){
			OrderItem oi =new OrderItem();
			oi.setLid(CommonUtils.UUID());
			oi.setCount(cartItem.getCount());
			oi.setSubtotal(cartItem.getSubTotal());
			oi.setBook(cartItem.getBook());
			oi.setOrder(order);
			orderItem.add(oi);
		}
		order.setOrderItemList(orderItem);
		cart.clear();
		orderService.add(order);
		request.setAttribute("order", order);
		return "f:/order/desc.jsp";
		
	}
	public String myOrders(HttpServletRequest request,HttpServletResponse response) {
		//从session获取user,通过uid获取所有的订单,把订单列表返回
		User user=(User) request.getSession().getAttribute("user");
		List<Order> orderList=orderService.myOrders(user.getU_id());
		System.out.println(orderList.toString());
		request.setAttribute("orderList", orderList);
		return "f:/order/list.jsp";
	}
}
