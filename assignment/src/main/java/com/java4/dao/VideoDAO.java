package com.java4.dao;

import java.util.List;

import com.java4.entity.Video;

public interface VideoDAO {
	Video findById(Integer id);

	Video findByVideoLink(String videoLink);

	List<Video> findAll();

	List<Video> findAll(int pageNumber, int pageSize);

	Video create(Video entity);

	Video update(Video entity);

	Video delete(Video entity);
}
