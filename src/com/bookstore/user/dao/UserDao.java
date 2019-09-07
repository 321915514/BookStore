package com.bookstore.user.dao;

import java.sql.SQLException;


import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import com.bookstore.user.domain.User;
import com.day11.dbutils.TxQueryRunner;

public class UserDao {
	//持久层
	private QueryRunner qr=new TxQueryRunner();
	
	//查找用户名
	public User findByUsername(String username) {
		try{
		String sql="select * from tb_user where username=?";
		return qr.query(sql, new BeanHandler<User>(User.class), username);
		}catch (SQLException e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
	}
	
	public User findByEmail(String email) {
		try{
			String sql="select * from tb_user where email=?";
			return qr.query(sql, new BeanHandler<User>(User.class), email);
			}catch (SQLException e) {
				// TODO: handle exception
				throw new RuntimeException(e);
			}
	}
	public void add(User user) {
		try {
			String sql="insert into tb_user values(?,?,?,?,?,?) ";
			Object[] params={user.getU_id(),user.getUsername(),user.getPassword(),user.getEmail(),user.getCode(),user.isState()};
			qr.update(sql,params);
		} catch (SQLException e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
	}
	
	public User findByCode(String code) {
		try{
			String sql="select * from tb_user where code=?";
			return qr.query(sql, new BeanHandler<User>(User.class), code);
			}catch (SQLException e) {
				// TODO: handle exception
				throw new RuntimeException(e);
			}
	}
	public void updateState(String uid,boolean state) {
		try{
			String sql="update tb_user set state= ?  where u_id= ?";
			 qr.update(sql, state, uid);
			}catch (SQLException e) {
				// TODO: handle exception
				throw new RuntimeException(e);
			}
	}
}
