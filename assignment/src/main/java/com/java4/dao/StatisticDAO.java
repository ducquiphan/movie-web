package com.java4.dao;

import java.util.List;

import com.java4.dto.VideoLikedInfo;

public interface StatisticDAO {

	List<VideoLikedInfo> findVideoLikedInfos();
	

}
