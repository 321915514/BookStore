package com.bookstore.phone.service;

import java.util.List;

import com.bookstore.phone.dao.PhoneDao;
import com.bookstore.phone.domain.Phone;

public class PhoneService {
	private PhoneDao phoneDao=new PhoneDao();

	public List<Phone> findAll() {
		// TODO Auto-generated method stub
		return phoneDao.findAll();
	}

	public Phone load(String pid) {
		// TODO Auto-generated method stub
		return phoneDao.load(pid);
	}

}
