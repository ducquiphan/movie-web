package com.java4.service.impl;

import java.util.List;

import com.java4.dao.VideoDAO;
import com.java4.dao.impl.VideoDAOImpl;
import com.java4.entity.Video;
import com.java4.service.VideoService;

// Nhớ bắt lỗi
public class VideoServiceImpl implements VideoService{

	private VideoDAO dao;
	
	public VideoServiceImpl() {
		// TODO Auto-generated constructor stub
		dao = new VideoDAOImpl();
	}
	
	@Override
	public Video findById(Integer id) {
		// TODO Auto-generated method stub
		return dao.findById(id);
	}

	@Override
	public Video findByVideoLink(String videoLink) {
		// TODO Auto-generated method stub
		if (videoLink.length() > 255) {
			return null;
		}
		return dao.findByVideoLink(videoLink);
	}

	@Override
	public List<Video> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	@Override
	public List<Video> findAll(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return dao.findAll(pageNumber, pageSize);
	}

	@Override
	public Video create(Video entity) {
		// TODO Auto-generated method stub
		entity.setIsActive(Boolean.TRUE);
		entity.setViews(0);
		entity.setShares(0);
		return dao.create(entity);
	}

	@Override
	public Video update(Video entity) {
		// TODO Auto-generated method stub
		return dao.update(entity);
	}

	@Override
	public Video delete(String videoLink) {
		// TODO Auto-generated method stub
		Video entity = findByVideoLink(videoLink);
		entity.setIsActive(Boolean.FALSE);
		return dao.update(entity);
	}
	
}
