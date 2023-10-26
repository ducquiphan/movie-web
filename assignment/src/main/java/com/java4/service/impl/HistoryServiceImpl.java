package com.java4.service.impl;

import java.sql.Timestamp;
import java.util.List;

import com.java4.dao.HistoryDAO;
import com.java4.dao.VideoDAO;
import com.java4.dao.impl.HistoryDAOImpl;
import com.java4.dao.impl.VideoDAOImpl;
import com.java4.entity.History;
import com.java4.entity.User;
import com.java4.entity.Video;
import com.java4.service.HistoryService;

public class HistoryServiceImpl implements HistoryService {
	private HistoryDAO dao;

	public HistoryServiceImpl() {
		// TODO Auto-generated constructor stub
		dao = new HistoryDAOImpl();
	}

	@Override
	public List<History> findByUser(String username) {
		// TODO Auto-generated method stub
		return dao.findByUser(username);
	}

	@Override
	public List<History> findByUserAndIsLiked(String username) {
		// TODO Auto-generated method stub
		return dao.findByUserAndIsLiked(username);
	}

	@Override
	public History findByUserIdAndVideoId(Integer userId, Integer videoId) {
		// TODO Auto-generated method stub
		return dao.findByUserIdAndVideoId(userId, videoId);
	}

	@Override
	public History create(User user, Video video) {
		// TODO Auto-generated method stub
		History history = new History();
		history.setUser(user);
		history.setVideo(video);
		history.setIsLiked(Boolean.FALSE);
		history.setViewdDate(new Timestamp(System.currentTimeMillis()));

		History existHistory = dao.findByUserIdAndVideoId(user.getId(), video.getId());
		if (existHistory == null) {

			VideoDAO videoDAO = new VideoDAOImpl();
			video.setViews(video.getViews() + 1);
			videoDAO.update(video);
			return dao.create(history);

		} else {
			return existHistory;
		}
	}

	@Override
	public boolean updateLikeOrUnlike(User user, String videoLink) {
		// TODO Auto-generated method stub
		Video video = new VideoDAOImpl().findByVideoLink(videoLink);
		History existHistory = findByUserIdAndVideoId(user.getId(), video.getId());
		existHistory.setIsLiked(!existHistory.getIsLiked());
		if (existHistory.getIsLiked()) {
			existHistory.setLikedDate(new Timestamp(System.currentTimeMillis()));
		} else {
			existHistory.setLikedDate(null);
		}
		History updateHistory = dao.update(existHistory);
		return updateHistory != null ? true : false;
	}

}
