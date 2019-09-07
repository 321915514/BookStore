package com.bookstore.phone.web.servlet;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.phone.service.PhoneService;

import servlet.BaseServlet;

public class PhoneServlet extends BaseServlet {
	private PhoneService phoneService=new PhoneService();
	public String findAll(HttpServletRequest request,HttpServletResponse response) throws IOException {
		 request.setAttribute("phoneList", phoneService.findAll());
		 return "f:/liebiao.jsp";
	}
	public String load(HttpServletRequest request,HttpServletResponse response) {
		String pid=request.getParameter("pid");
		request.setAttribute("phone", phoneService.load(pid));
		return "f:/xiangqing.jsp";
		
	}
}
