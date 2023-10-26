package com.java4.utils;

import java.io.IOException;
import java.util.Date;

import com.java4.constant.SessionAttribute;
import com.java4.entity.User;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebFilter("/account/*")
public class LoggerFilter implements HttpFilter{

	@Override
	public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		User user = (User) request.getSession().getAttribute(SessionAttribute.CURRENT_USER);
		String uri = request.getRequestURI();
		Date time = new Date();
		// ghi nhận user, uri, time, vào CSDL hoặc file
		chain.doFilter(request, response);
	}
	
}
