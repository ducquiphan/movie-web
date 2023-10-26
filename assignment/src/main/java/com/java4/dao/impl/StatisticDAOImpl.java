package com.java4.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.java4.dao.AbstractDAO;
import com.java4.dao.StatisticDAO;
import com.java4.dto.VideoLikedInfo;

public class StatisticDAOImpl extends AbstractDAO<Object[]> implements StatisticDAO{

	@Override
	public List<VideoLikedInfo> findVideoLikedInfos() {
		// TODO Auto-generated method stub
		String sql= "select v.id, v.title, v.video, SUM(CAST(h.isLiked as int)) as totalLike "
				+ "from video v left join history h on v.id = h.videoId "
				+ "where v.isActive = 1 "
				+ "group by v.id, v.title, v.video "
				+ "order by SUM(CAST(h.isLiked as int)) desc";
		List<Object[]> objects = super.findManyByNaiveQuery(sql);
		List<VideoLikedInfo> result = new ArrayList<VideoLikedInfo>();
		objects.forEach(object -> {
			VideoLikedInfo lInfo = setDataVideoLikedInfo(object);
			result.add(lInfo);
		});
		return result;
	}
	
	private VideoLikedInfo setDataVideoLikedInfo(Object[] object) {
		VideoLikedInfo videoLikedInfo = new VideoLikedInfo();
		videoLikedInfo.setVideoId((Integer)object[0]);
		videoLikedInfo.setTitle((String)object[1]);
		videoLikedInfo.setLink((String)object[2]);
		videoLikedInfo.setTotalLike(object[3] == null ? 0 : (Integer) object[3]);
		return videoLikedInfo;
	}
	
}
