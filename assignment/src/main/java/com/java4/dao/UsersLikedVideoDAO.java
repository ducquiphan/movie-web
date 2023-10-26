package com.java4.dao;

import java.util.List;
import java.util.Map;

import com.java4.entity.Report;

public interface UsersLikedVideoDAO {
	List<Report> findUsersLikedByVideoLink(Map<String, Object> params);
}
