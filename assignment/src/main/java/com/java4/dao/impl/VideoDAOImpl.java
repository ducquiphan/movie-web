package com.java4.dao.impl;

import java.util.List;

import com.java4.dao.AbstractDAO;
import com.java4.dao.VideoDAO;
import com.java4.entity.Video;

public class VideoDAOImpl extends AbstractDAO<Video> implements VideoDAO{

	@Override
	public Video findById(Integer id) {
		// TODO Auto-generated method stub
		return super.findById(Video.class, id);
	}

	@Override
	public Video findByVideoLink(String videoLink) {
		// TODO Auto-generated method stub
		String sql = "select o from Video o where o.video = ?1";
		return super.findOne(Video.class, sql, videoLink);
	}

	@Override
	public List<Video> findAll() {
		// TODO Auto-generated method stub
		return super.findAll(Video.class, true);
	}

	@Override
	public List<Video> findAll(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return super.findAll(Video.class, true, pageNumber, pageSize);
	}

	
}
