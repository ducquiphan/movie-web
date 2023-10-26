package com.java4.dto;

public class VideoLikedInfo {
	private Integer videoId;
	private String title;
	private String link;
	private Integer totalLike;
	
	public VideoLikedInfo() {
		// TODO Auto-generated constructor stub
	}
	
	public Integer getVideoId() {
		return videoId;
	}
	public void setVideoId(Integer videoId) {
		this.videoId = videoId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public Integer getTotalLike() {
		return totalLike;
	}
	public void setTotalLike(Integer totalLike) {
		this.totalLike = totalLike;
	}
	
	
}
