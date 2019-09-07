package com.bookstore.category.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.bookstore.category.domain.Category;
import com.day11.dbutils.TxQueryRunner;

public class CategoryDao {
	QueryRunner qr=new TxQueryRunner();

	public List<Category> findAll() {
		// TODO Auto-generated method stub
		String sql="select * from category";
		try {
			return qr.query(sql, new BeanListHandler<Category>(Category.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
	}
}
