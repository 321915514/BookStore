package com.bookstore.category.service;

import java.util.List;

import com.bookstore.category.dao.CategoryDao;
import com.bookstore.category.domain.Category;

public class CategoryService {
	private CategoryDao categoryDao=new CategoryDao();

	public List<Category> findAll() {
		// TODO Auto-generated method stub
		return categoryDao.findAll();
	}
}
