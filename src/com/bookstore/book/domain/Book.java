package com.bookstore.book.domain;

import java.util.Date;

public class Book {
	private String bid;
	private String bname;
	private double price;
	private String author;
	private String pub;
	private Date record;
	private String image;
	public String getPub() {
		return pub;
	}
	public void setPub(String pub) {
		this.pub = pub;
	}
	public Date getRecord() {
		return record;
	}
	public void setRecord(Date record) {
		this.record = record;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	private int sort;
	private int sum;
	
	
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}

}
