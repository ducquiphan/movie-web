package com.java4.service.impl;

import java.util.List;

import com.java4.dao.UserDAO;
import com.java4.dao.impl.UserDAOImpl;
import com.java4.entity.User;
import com.java4.service.UserService;

public class UserServiceImpl implements UserService{

	private UserDAO dao;
	
	public UserServiceImpl() {
		// TODO Auto-generated constructor stub
		dao = new UserDAOImpl();
	}
	
	@Override
	public User findById(Integer id) {
		// TODO Auto-generated method stub
		return dao.findById(id);
	}

	@Override
	public User findByEmail(String email) {
		// TODO Auto-generated method stub
		return dao.findByEmail(email);
	}

	@Override
	public User findByUsername(String username) {
		// TODO Auto-generated method stub
		return dao.findByUsername(username);
	}

	@Override
	public User login(String username, String password) {
		// TODO Auto-generated method stub
		// debcrypt md5
		return dao.findByUsernameAndPassword(username, password);
	}

	@Override
	public User resetPassword(String email) {
		// TODO Auto-generated method stub
		User user = findByEmail(email);
		if (user != null) {
			return user;
		}
		return null;
	}

	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	@Override
	public List<User> findAll(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return dao.findAll(pageNumber, pageSize);
	}

	@Override
	public User create(String username, String password, String email) {
		// TODO Auto-generated method stub
		User user = new User();
		user.setUsername(username);
		user.setPassword(password); // bcrypt md5
		user.setEmail(email);
		user.setIsAdmin(Boolean.FALSE);
		user.setIsActive(Boolean.TRUE);
		return dao.create(user);
	}

	@Override
	public User update(User entity) {
		// TODO Auto-generated method stub
		return dao.update(entity);
	}

	@Override
	public User delete(String username) {
		// TODO Auto-generated method stub
		User user = dao.findByUsername(username);
		user.setIsActive(Boolean.FALSE);
		return dao.update(user);
	}
	
}
