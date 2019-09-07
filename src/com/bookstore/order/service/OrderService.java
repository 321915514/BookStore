package com.bookstore.order.service;

import java.util.List;

import com.bookstore.order.dao.OrderDao;
import com.bookstore.order.domain.Order;
import com.day11.dbutils.JdbcUtils;

public class OrderService {
	private OrderDao orderDao=new OrderDao();
	public void add(Order order) throws Exception {
		try {
			JdbcUtils.beginTransaction();
			orderDao.addOrder(order);//订单
			orderDao.addItemList(order.getOrderItemList());//条目
			JdbcUtils.commitTransaction();
		} catch (Exception e) {
			// TODO Auto-generated catch block
				JdbcUtils.rollbackTransaction();
				// TODO Auto-generated catch block
			}
		}
	public  List<Order> myOrders(String u_id) {
		// TODO Auto-generated method stub
		return orderDao.findByUid(u_id);
	}
	
	
	}
