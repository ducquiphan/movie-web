package com.java4.service.impl;

import com.java4.entity.User;
import com.java4.service.EmailService;
import com.java4.utils.SendEmailUtils;

import jakarta.servlet.ServletContext;

public class EmailServiceImpl implements EmailService {

	private static final String EMAIL_WELCOME_SUBJECT = "Welcome to Online Entertainment";
	private static final String EMAIL_FORGOT_PASSWORD = "Online Entertainment - New password";
	private static final String EMAIL_SEND = "Online Entertainment - Share video";

	@Override
	public void sendMail(ServletContext servletContext, User recipient, String type) {
		// TODO Auto-generated method stub
		String host = servletContext.getInitParameter("host");
		String port = servletContext.getInitParameter("port");
		String user = servletContext.getInitParameter("user");
		String pass = servletContext.getInitParameter("pass");

		try {
			String content = null;
			String subject = null;
			switch (type) {
			case "welcome": {
				subject = EMAIL_WELCOME_SUBJECT;
				content = "Dear " + recipient.getUsername() + ", hope you have a good time!";
				break;
			}
			case "forgot": {
				subject = EMAIL_FORGOT_PASSWORD;
				content = "Dear " + recipient.getUsername() + ", your password is: " + recipient.getPassword();
				break;
			}
			default:
				subject = "Online Entertainment";
				content = "Maybe this email is wrong, don't care about it";
				throw new IllegalArgumentException("Unexpected value: " + type);
			}
			SendEmailUtils.sendEmail(host, port, user, pass, recipient.getEmail(), subject, content);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@Override
	public void sendMail(ServletContext servletContext, User recipient, String email, String link) {
		// TODO Auto-generated method stub
		String host = servletContext.getInitParameter("host");
		String port = servletContext.getInitParameter("port");
		String user = servletContext.getInitParameter("user");
		String pass = servletContext.getInitParameter("pass");

		try {
			String content = null;
			String subject = null;
			subject = EMAIL_SEND;
			content = "Dear " + email + ", your friend " + recipient.getUsername() + " introduce you to this video"
					+ link;
			SendEmailUtils.sendEmail(host, port, user, pass, email, subject, content);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
