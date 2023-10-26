package com.java4.entity;

import java.sql.Timestamp;

import org.hibernate.annotations.CreationTimestamp;

import com.java4.constant.NamedStored;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.NamedStoredProcedureQueries;
import jakarta.persistence.NamedStoredProcedureQuery;
import jakarta.persistence.StoredProcedureParameter;

@NamedStoredProcedureQueries({
		@NamedStoredProcedureQuery(name = NamedStored.STORED_FIND_USERS_LIKED_VIDEO_BY_VIDEO_LINK, 
				procedureName = "sp_selectUsersLikedVideoByVideoLink", 
				parameters = @StoredProcedureParameter(name = "videoLink", type = String.class), 
				resultClasses = { Report.class }) })

@Entity
public class Report {
	@Id
	private String username;
	
	private String email;
	
	@CreationTimestamp
	private Timestamp likedDate;

	public Report() {
		// TODO Auto-generated constructor stub
	}

	
	
	public Report(String username, String email, Timestamp likedDate) {
		super();
		this.username = username;
		this.email = email;
		this.likedDate = likedDate;
	}



	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Timestamp getLikedDate() {
		return likedDate;
	}

	public void setLikedDate(Timestamp likedDate) {
		this.likedDate = likedDate;
	}

	

}
