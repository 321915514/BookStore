package com.bookstore.category.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.json.JsonArray;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.category.domain.Category;
import com.bookstore.category.service.CategoryService;

import net.sf.json.JSONArray;
import servlet.BaseServlet;

public class CategoryServlet extends BaseServlet {
	private CategoryService categoryService=new CategoryService();
	public String findAll(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setAttribute("categoryList", categoryService.findAll());
		System.out.println(categoryService.findAll());
		return "f:/index.jsp";
	}
}
