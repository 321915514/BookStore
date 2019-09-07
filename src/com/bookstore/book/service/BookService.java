package com.bookstore.book.service;

import java.util.List;

import org.junit.Test;

import com.bookstore.book.dao.BookDao;
import com.bookstore.book.domain.Book;

public class BookService {
	private BookDao bookDao=new BookDao();
	public List<Book> findAll() {
		// TODO Auto-generated method stub
		return bookDao.findAll();
	}

	public Book load(String bid) {
		// TODO Auto-generated method stub
		return bookDao.load(bid);
	}
	@Test
	public void test1(){
		Book book= bookDao.load("2");
		System.out.println(book.getBname());
	}
}
