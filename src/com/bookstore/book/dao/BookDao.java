package com.bookstore.book.dao;

import java.sql.SQLException;


import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.bookstore.book.domain.Book;
import com.day11.dbutils.TxQueryRunner;

public class BookDao {
	QueryRunner qr=new TxQueryRunner();
	public List<Book> findAll() {
		// TODO Auto-generated method stub
		String sql="select * from book";
		try {
			return qr.query(sql, new BeanListHandler<Book>(Book.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
	}

	public Book load(String bid) {
		// TODO Auto-generated method stub
		String sql="select * from book where bid= ?";
		try {
			return qr.query(sql, new BeanHandler<Book>(Book.class),bid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
	}

}
