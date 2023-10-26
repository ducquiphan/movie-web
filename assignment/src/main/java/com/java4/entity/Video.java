package com.java4.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;


@Entity
@Table(name = "Video")
public class Video {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "video")
	private String video;
	
	@Column(name = "poster")
	private String poster;
	
	@Column(name = "[views]")
	private Integer views;
	
	@Column(name = "shares")
	private Integer shares;
	
	@Column(name = "[description]")
	private String description;
	
	@Column(name = "isActive"/* , columnDefinition = "" */)
	private Boolean isActive;
	
	
	public Video() {
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}



	public void setId(Integer id) {
		this.id = id;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getPoster() {
		return poster;
	}



	public void setPoster(String poster) {
		this.poster = poster;
	}



	public String getVideo() {
		return video;
	}



	public void setVideo(String video) {
		this.video = video;
	}



	public Integer getViews() {
		return views;
	}



	public void setViews(Integer views) {
		this.views = views;
	}



	public Integer getShares() {
		return shares;
	}



	public void setShares(Integer shares) {
		this.shares = shares;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public Boolean getIsActive() {
		return isActive;
	}



	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

//	public List<History> getHistories() {
//		return histories;
//	}
//
//	public void setHistories(List<History> histories) {
//		this.histories = histories;
//	}

	

}