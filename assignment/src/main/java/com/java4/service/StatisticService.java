package com.java4.service;

import java.util.List;

import com.java4.dto.VideoLikedInfo;

public interface StatisticService {
	List<VideoLikedInfo> findVideoLikedInfos();
}
