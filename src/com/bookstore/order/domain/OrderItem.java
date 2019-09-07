package com.bookstore.order.domain;

import com.bookstore.book.domain.Book;

public class OrderItem {
	private String lid;
	private int count;
	private double subtotal;
	private Order order;
	private Book book;
	
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public String getLid() {
		return lid;
	}
	public void setLid(String lid) {
		this.lid = lid;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	@Override
	public String toString() {
		return "OrderItem [lid=" + lid + ", count=" + count + ", subtotal=" + subtotal + ", order=" + order + ", book="
				+ book + "]";
	}

}
