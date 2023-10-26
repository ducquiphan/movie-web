package com.java4.service;

import java.util.List;

import com.java4.entity.History;
import com.java4.entity.User;
import com.java4.entity.Video;

public interface HistoryService {
	List<History> findByUser(String username);

	List<History> findByUserAndIsLiked(String username);

	History findByUserIdAndVideoId(Integer userId, Integer videoId);

	History create(User user, Video video);

	boolean updateLikeOrUnlike(User user, String videoLink);
}
