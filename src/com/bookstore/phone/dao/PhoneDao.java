package com.bookstore.phone.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.bookstore.phone.domain.Phone;
import com.day11.dbutils.TxQueryRunner;

public class PhoneDao {
	private QueryRunner qr=new TxQueryRunner();

	public List<Phone> findAll() {
		// TODO Auto-generated method stub
		String sql="select * from phone";
		try {
			return qr.query(sql, new BeanListHandler<Phone>(Phone.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
	}

	public Phone load(String pid) {
		// TODO Auto-generated method stub
		String sql="select * from phone where pid=?";
		try {
			return qr.query(sql, new BeanHandler<Phone>(Phone.class),pid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
	}

}
