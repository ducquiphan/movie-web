package com.java4.dao.impl;

import java.util.List;

import com.java4.dao.AbstractDAO;
import com.java4.dao.HistoryDAO;
import com.java4.entity.History;

public class HistoryDAOImpl extends AbstractDAO<History> implements HistoryDAO{

	@Override
	public List<History> findByUser(String username) {
		// TODO Auto-generated method stub
		String sql = "select o from History o where o.user.username = ?1 and o.video.isActive = 1"
				+ " order by o.viewedDate desc";
		return super.findMany(History.class, sql, username);
	}

	@Override
	public List<History> findByUserAndIsLiked(String username) {
		// TODO Auto-generated method stub
		String sql = "select o from History o where o.user.username = ?1 and o.isLiked = 1"
				+ " and o.video.isActive = 1"
				+ " order by o.viewedDate desc";
		return super.findMany(History.class, sql, username);
	}

	@Override
	public History findByUserIdAndVideoId(Integer userId, Integer videoId) {
		// TODO Auto-generated method stub
		String sql = "select o from History o where o.user.id = ?1 and o.video.id = ?2"
				+ " and o.video.isActive = 1";
		return super.findOne(History.class, sql, userId, videoId);
	}


}
