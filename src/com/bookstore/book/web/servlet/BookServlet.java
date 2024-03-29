package com.bookstore.book.web.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.book.service.BookService;

import servlet.BaseServlet;

public class BookServlet extends BaseServlet {
		private BookService bookService=new BookService();
		public String findAll(HttpServletRequest request,HttpServletResponse response){
			 request.setAttribute("bookList", bookService.findAll());
			 return "f:/liebiao.jsp";
		}
		public String load(HttpServletRequest request,HttpServletResponse response) {
			String bid=request.getParameter("bid");
			request.setAttribute("book",bookService.load(bid));
			return "f:/xiangqing.jsp";
		}
}
