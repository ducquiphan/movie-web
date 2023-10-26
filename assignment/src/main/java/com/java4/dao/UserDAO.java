package com.java4.dao;

import java.util.List;

import com.java4.entity.User;

public interface UserDAO {
	User findById(Integer id);

	User findByEmail(String email);

	User findByUsername(String username);

	User findByUsernameAndPassword(String username, String password);

	List<User> findAll();

	List<User> findAll(int pageNumber, int pageSize);

	User create(User entity);

	User update(User entity);

	User delete(User entity);
}
