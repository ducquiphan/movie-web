package com.java4.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.java4.dao.UsersLikedVideoDAO;
import com.java4.dao.impl.UsersLikedVideoDAOImpl;
import com.java4.entity.Report;
import com.java4.service.ReportService;

public class ReportServiceImpl implements ReportService{

	UsersLikedVideoDAO usersLikedVideoDAO;
	
	public ReportServiceImpl() {
		// TODO Auto-generated constructor stub
		usersLikedVideoDAO = new UsersLikedVideoDAOImpl();
	}
	
	@Override
	public List<Report> findUsersLikedByVideoLink(String videoLink) {
		// TODO Auto-generated method stub
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("videoLink", videoLink);
		return usersLikedVideoDAO.findUsersLikedByVideoLink(params);
	}

}
