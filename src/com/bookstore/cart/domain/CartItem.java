package com.bookstore.cart.domain;

import java.math.BigDecimal;

import com.bookstore.book.domain.Book;

public class CartItem {
	private Book book;
	private int count;
	//小计方法
	public double getSubTotal(){
		BigDecimal d1=new BigDecimal(book.getPrice()+"");
		BigDecimal d2=new BigDecimal(count+"");
		return d1.multiply(d2).doubleValue();
	}
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}
	
}
