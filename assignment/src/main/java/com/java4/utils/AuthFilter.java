package com.java4.utils;

import java.io.IOException;

import com.java4.constant.SessionAttribute;
import com.java4.entity.User;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebFilter({ "/account/sign-in", "/account/sign-up", "/account/sign-out", "/account/forgot-password",
		"/account/change-password", "/account/edit-profile" })
public class AuthFilter implements HttpFilter {

	@Override
	public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		User user = (User) request.getSession().getAttribute(SessionAttribute.CURRENT_USER);
		String error = "";
		boolean isLogin = false;
		if (uri.contains("change-password") || uri.contains("edit-profile")) {
			isLogin = true;
		}
		if (user == null && isLogin) {
			// Chưa đăng nhập
			error = response.encodeURL("Please Login");

		} else if (!user.getIsAdmin() && uri.contains("/admin/")) { // Không phải admin
			error = response.encodeURL("Please Login with admin");

		}
		if (!error.isEmpty()) {
			// truy cập không hợp lệ
			request.getSession().setAttribute("securi", uri);
			response.sendRedirect("/account/login?error=" + response.encodeURL(error));
		} else {
			// truy cập hợp lệ
			chain.doFilter(request, response);
		}

	}

}
