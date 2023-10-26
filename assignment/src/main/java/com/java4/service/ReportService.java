package com.java4.service;

import java.util.List;

import com.java4.entity.Report;

public interface ReportService {
	List<Report> findUsersLikedByVideoLink(String videoLink);
}
