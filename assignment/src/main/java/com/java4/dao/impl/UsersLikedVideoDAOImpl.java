package com.java4.dao.impl;

import java.util.List;
import java.util.Map;

import com.java4.constant.NamedStored;
import com.java4.dao.AbstractDAO;
import com.java4.dao.UsersLikedVideoDAO;
import com.java4.entity.Report;

public class UsersLikedVideoDAOImpl extends AbstractDAO<Report> implements UsersLikedVideoDAO{

	@Override
	public List<Report> findUsersLikedByVideoLink(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return super.callStored(NamedStored.STORED_FIND_USERS_LIKED_VIDEO_BY_VIDEO_LINK, params);
	}
}
