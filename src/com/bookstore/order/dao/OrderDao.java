package com.bookstore.order.dao;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import com.bookstore.book.domain.Book;
import com.bookstore.order.domain.Order;
import com.bookstore.order.domain.OrderItem;
import com.day11.dbutils.TxQueryRunner;

import utils.CommonUtils;

public class OrderDao {
	private QueryRunner qr=new TxQueryRunner();
	public void addOrder(Order order) {
		//utildate转sqldate用timestmp 转换
		try {
			String sql="insert into orders values(?,?,?,?,?,?)";
			Timestamp timestamp=new Timestamp(order.getOrdertime().getTime());
			Object[] params={order.getOid(),timestamp,order.getTotal(),order.getState(),order.getOwner().getU_id(),order.getAddress()};
			qr.update(sql,params);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
	}
	//插入订单条目
	public void addItemList(List<OrderItem> orderItemList) {
		/*
		 * QueryRunner类的batch(String sql,object[] params);
		 * 其中params是多个一维数组
		 * 每一个一维数组都与sql在一起执行一次,多个一维数组就执行多次.
		 * 
		 * */
		try {
			String sql="insert into orderitem values(?,?,?,?,?)";
			Object[][] params = new Object[orderItemList.size()][];
		for (int i = 0; i < orderItemList.size(); i++) {
			OrderItem orderItem=orderItemList.get(i);
			params[i]=new Object[]{orderItem.getLid(),orderItem.getCount(),orderItem.getSubtotal(),orderItem.getOrder().getOid(),orderItem.getBook().getBid()};
		}
			qr.batch(sql, params);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
	}
	
	public  List<Order>  findByUid(String u_id) {
		// TODO Auto-generated method stub
		//获取用户的订单,循环遍历每一个order为其加载所有的orderItem
		try {
			String sql="select * from orders where uid=?";
			List<Order> orderList=qr.query(sql, new BeanListHandler<Order>(Order.class),u_id);
				for (Order order : orderList) {
					loadOrderItems(order);
				}
			return orderList;
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
	}
	/*
	 * 加载指定的订单所有的条目得到一个list,并且这个list里面包含多个map
	 * 
	 * */
	private void loadOrderItems(Order order) throws SQLException {
		// TODO Auto-generated method stub
		String sql="select * from orderitem i ,book b where  i.bid=b.bid and oid=?";
		List<Map<String, Object>> mapList=qr.query(sql, new MapListHandler(),order.getOid());
		List<OrderItem> orderItemList=toOrderItemList(mapList);
		order.setOrderItemList(orderItemList);
	}
	/*
	 * 
	 * 将list的每个map转换成两个对象并建立关系
	 * 
	 * */
	private List<OrderItem> toOrderItemList(List<Map<String, Object>> mapList) {
		// TODO Auto-generated method stub
		List<OrderItem> orderItemList=new ArrayList<OrderItem>();
		for (Map<String, Object> map : mapList) {
			OrderItem item=toOrderItem(map);
			orderItemList.add(item);
		}
		return orderItemList;
	}
	/*
	 * 
	 * 
	 * //得到一个map将这个map变为两个对象,并且创建关系
	 * */
	private OrderItem toOrderItem(Map<String, Object> map) {
		// TODO Auto-generated method stub
		OrderItem orderItem=CommonUtils.toBean(map, OrderItem.class);
		Book book=CommonUtils.toBean(map, Book.class);
		orderItem.setBook(book);
		return orderItem;
		
	}

}
