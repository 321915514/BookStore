package com.bookstore.user.service;

import com.bookstore.user.dao.UserDao;
import com.bookstore.user.domain.User;
import com.bookstore.user.service.UserException;

public class UserService {
	private UserDao userDao=new UserDao();
	public void regist(User form) throws Exception {
		User user=userDao.findByUsername(form.getUsername());
		if (user!=null) throw new UserException("用户名已被注册");
		
		
		User email=userDao.findByEmail(form.getEmail());
		if (email!=null) throw new UserException("Email已被注册");
		//
		userDao.add(form);
	}
	public void active(String code) throws Exception {
		User user=userDao.findByCode(code);
		if (user==null) throw new UserException("激活码无效");
		if (user.isState()) throw new UserException("你已激活,傻");	
		userDao.updateState(user.getU_id(),true);
	}
	public User login(User form) throws Exception {
		User user=userDao.findByUsername(form.getUsername());
		if (user==null) throw new UserException("用户名不存在");
		if (!user.getPassword().equals(form.getPassword())) throw new UserException("密码错误");
		if (!user.isState()) throw new UserException("你是死的,还未激活");
		return user;
	}
	

	
}
