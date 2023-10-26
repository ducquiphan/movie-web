package com.java4.dao.impl;

import java.util.List;

import com.java4.dao.AbstractDAO;
import com.java4.dao.UserDAO;
import com.java4.entity.User;

public class UserDAOImpl extends AbstractDAO<User> implements UserDAO{

	@Override
	public User findById(Integer id) {
		// TODO Auto-generated method stub
		return super.findById(User.class, id);
	}

	@Override
	public User findByEmail(String email) {
		// TODO Auto-generated method stub
		String sql = "select o from User o where o.email = ?1";
		return super.findOne(User.class, sql, email);
	}

	@Override
	public User findByUsername(String username) {
		// TODO Auto-generated method stub
		String sql = "select o from User o where o.username = ?1";
		return super.findOne(User.class, sql, username);
	}

	@Override
	public User findByUsernameAndPassword(String username, String password) {
		// TODO Auto-generated method stub
		String sql = "select o from User o where o.username = ?1 and o.password = ?2";
		return super.findOne(User.class, sql, username, password);
	}

	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		return super.findAll(User.class, true);
	}
	
	@Override
	public List<User> findAll(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return super.findAll(User.class, true, pageNumber, pageSize);
	}
}
