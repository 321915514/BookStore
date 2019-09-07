package com.bookstore.cart.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.book.domain.Book;
import com.bookstore.book.service.BookService;
import com.bookstore.cart.domain.Cart;
import com.bookstore.cart.domain.CartItem;
import servlet.BaseServlet;

public class CartServlet extends BaseServlet {
	public String add(HttpServletRequest request,HttpServletResponse response) {
		Cart cart=(Cart) request.getSession().getAttribute("cart");
		String bid=request.getParameter("bid");
		Book book=new BookService().load(bid);
		CartItem cartItem=new CartItem();
		cartItem.setBook(book);
		int count=Integer.parseInt(request.getParameter("count"));
		cartItem.setCount(count);
		cart.add(cartItem);
		return "f:/gouwuche.jsp";
	}
	public String clear(HttpServletRequest request,HttpServletResponse response) {
		Cart cart=(Cart) request.getSession().getAttribute("cart");
		cart.clear();
		return "f:/gouwuche.jsp";
	}
	public String delete(HttpServletRequest request,HttpServletResponse response) {
		String bid = request.getParameter("bid");
		Cart cart=(Cart) request.getSession().getAttribute("cart");
		cart.delete(bid);
		return "f:/gouwuche.jsp";
}
/*	public String jisuan(HttpServletRequest request , HttpServletResponse response) throws IOException {
		String text=request.getParameter("bid");
		System.out.println(text);
		response.getWriter().print(text);
		return "f:/gouwuche.jsp";
	}*/
	
}
