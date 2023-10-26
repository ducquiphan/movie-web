package com.java4.service.impl;

import java.util.List;

import com.java4.dao.StatisticDAO;
import com.java4.dao.impl.StatisticDAOImpl;
import com.java4.dto.VideoLikedInfo;
import com.java4.service.StatisticService;

public class StatisticServiceImpl implements StatisticService{
	
	private StatisticDAO statisticDAO;
	
	public StatisticServiceImpl() {
		// TODO Auto-generated constructor stub
		statisticDAO = new StatisticDAOImpl();
	}

	@Override
	public List<VideoLikedInfo> findVideoLikedInfos() {
		// TODO Auto-generated method stub
		return statisticDAO.findVideoLikedInfos();
	}

}
