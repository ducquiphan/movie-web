package com.java4.service;

import com.java4.entity.User;

import jakarta.servlet.ServletContext;

public interface EmailService {
	void sendMail(ServletContext servletContext, User recipient, String type);

	void sendMail(ServletContext servletContext, User recipient, String email, String link);
}
