package com.java4.service;

import java.util.List;

import com.java4.entity.Video;

public interface VideoService {
	Video findById(Integer id);

	Video findByVideoLink(String videoLink);

	List<Video> findAll();

	List<Video> findAll(int pageNumber, int pageSize);

	Video create(Video entity);

	Video update(Video entity);

	Video delete(String videoLink);
}
