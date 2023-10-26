package com.java4.dao;

import java.util.List;

import com.java4.entity.History;

public interface HistoryDAO {
	List<History> findByUser(String username);

	List<History> findByUserAndIsLiked(String username);

	History findByUserIdAndVideoId(Integer userId, Integer videoId);

	History create(History entity);

	History update(History entity);
}
