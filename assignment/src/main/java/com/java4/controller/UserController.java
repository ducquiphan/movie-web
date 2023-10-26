package com.java4.controller;

import java.io.IOException;

import com.java4.constant.SessionAttribute;
import com.java4.entity.User;
import com.java4.service.EmailService;
import com.java4.service.UserService;
import com.java4.service.impl.EmailServiceImpl;
import com.java4.service.impl.UserServiceImpl;
import com.java4.utils.XValidate;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/account/login", "/account/logout", "/account/register" , "/account/forgotPassword", "/account/changePassword", "/account/editProfile"})
public class UserController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2392162893955174422L;

	private UserService userService = new UserServiceImpl();
	private EmailService emailService = new EmailServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = req.getServletPath(); // get after project name
		switch (path) {
		case "/account/login": {
			doGetLogin(req, resp);
			break;
		}
		case "/account/register": {
			doGetRegister(req, resp);
			break;
		}
		case "/account/forgotPassword": {
			doGetForgotPassword(req, resp);
			break;
		}
		case "/account/changePassword": {
			doGetChangePassword(req, resp);
			break;
		}
		case "/account/editProfile": {
			doGetEditProfile(req, resp);
			break;
		}
		case "/account/logout": {
			doGetLogout(req, resp);
			break;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + path);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = req.getServletPath(); // get after project name
		switch (path) {
		case "/account/login": {
			doPostLogin(req, resp);
			break;
		}
		case "/account/register": {
			doPostRegister(req, resp);
			break;
		}
		case "/account/forgotPassword": {
			doPostForgotPassword(req, resp);
			break;
		}
		case "/account/changePassword": {
			doPostChangePassword(req, resp);
			break;
		}
		case "/account/editProfile": {
			doPostEditProfile(req, resp);
			break;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + path);
		}
	}
	
	private void doPostEditProfile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = req.getParameter("email");
		
		try {
			if (email.isBlank()) {
				req.setAttribute("message", "Vui lòng nhập email");
				req.getRequestDispatcher("/views/user/edit-profile.jsp").forward(req, resp);
				return;
			} else if (email.length() > 255) {
				req.setAttribute("message", "Email không được dài quá 255 ký tự");
				req.getRequestDispatcher("/views/user/edit-profile.jsp").forward(req, resp);
				return;
			} else if (XValidate.checkMail(email)) {
				req.setAttribute("message", "Email không hợp lệ");
				req.getRequestDispatcher("/views/user/edit-profile.jsp").forward(req, resp);
				return;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		User user = (User) req.getSession().getAttribute(SessionAttribute.CURRENT_USER);
		User existNewEmail = userService.findByEmail(email);
		if (existNewEmail == null) {
			user.setEmail(email);
			User updateUser = userService.update(user);
			req.setAttribute(SessionAttribute.CURRENT_USER, updateUser);
			req.setAttribute("message", "Cập nhật thông tin thành công!");
			req.getRequestDispatcher("/views/user/edit-profile.jsp").forward(req, resp);
		}else if (user.getEmail().equals(existNewEmail.getEmail())) {
			req.setAttribute("message", "Cập nhật thông tin thành công!");
			req.getRequestDispatcher("/views/user/edit-profile.jsp").forward(req, resp);
		}else {
			req.setAttribute("message", "Email này đã được sử dụng!");
			req.getRequestDispatcher("/views/user/edit-profile.jsp").forward(req, resp);
		}
		
	}

	private void doPostChangePassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String oldPass = req.getParameter("oldPass");
		String newPass = req.getParameter("newPass");
		String newPassReCheck = req.getParameter("newPassReCheck");
		
		try {
			if (oldPass.isBlank()) {
				req.setAttribute("message", "Vui lòng nhập mật khẩu cũ");
				req.getRequestDispatcher("/views/user/change-password.jsp").forward(req, resp);
				return;
			} else if (oldPass.length() > 20) {
				req.setAttribute("message", "Mật khẩu cũ không được dài quá 20 ký tự");
				req.getRequestDispatcher("/views/user/change-password.jsp").forward(req, resp);
				return;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		try {
			if (newPass.isBlank()) {
				req.setAttribute("message", "Vui lòng nhập mật khẩu mới");
				req.getRequestDispatcher("/views/user/change-password.jsp").forward(req, resp);
				return;
			} else if (newPass.length() > 20) {
				req.setAttribute("message", "Mật khẩu mới không được dài quá 20 ký tự");
				req.getRequestDispatcher("/views/user/change-password.jsp").forward(req, resp);
				return;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		User user = (User) req.getSession().getAttribute(SessionAttribute.CURRENT_USER);
		
		if (user.getPassword().equals(oldPass)) {
			if (newPass.equals(newPassReCheck)) {
				user.setPassword(newPass);
				User updateUser = userService.update(user);
				req.setAttribute(SessionAttribute.CURRENT_USER, updateUser);
				req.setAttribute("message", "Cập nhật mật khẩu thành công!");
				req.getRequestDispatcher("/views/user/change-password.jsp").forward(req, resp);
			}else {
				req.setAttribute("message", "Mật khẩu xác nhận không trùng khớp!");
				req.getRequestDispatcher("/views/user/change-password.jsp").forward(req, resp);
			}
		}else {
			req.setAttribute("message", "Mật khẩu không đúng!");
			req.getRequestDispatcher("/views/user/change-password.jsp").forward(req, resp);
			
		}
	}

	private void doGetEditProfile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/edit-profile.jsp");
		requestDispatcher.forward(req, resp);
	}

	private void doGetChangePassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/change-password.jsp");
		requestDispatcher.forward(req, resp);
	}

	private void doPostForgotPassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = req.getParameter("username") ;
		String email = req.getParameter("email");
		
		try {
			if (username.isBlank()) {
				req.setAttribute("message", "Vui lòng nhập Username");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/forgot-password.jsp");
				requestDispatcher.forward(req, resp);
				return;
			} else if (username.length() > 10) {
				req.setAttribute("message", "Username không được dài quá 10 ký tự");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/forgot-password.jsp");
				requestDispatcher.forward(req, resp);
				return;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		try {
			if (email.isBlank()) {
				req.setAttribute("message", "Vui lòng nhập email");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/forgot-password.jsp");
				requestDispatcher.forward(req, resp);
				return;
			} else if (email.length() > 255) {
				req.setAttribute("message", "Email không được dài quá 255 ký tự");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/forgot-password.jsp");
				requestDispatcher.forward(req, resp);
				return;
			} else if (XValidate.checkMail(email)) {
				req.setAttribute("message", "Email không hợp lệ");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/forgot-password.jsp");
				requestDispatcher.forward(req, resp);
				return;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		User existUser = userService.findByUsername(username);
		User emailUser = userService.resetPassword(email);
		
		if (existUser != null ) {
			if (emailUser != null) {
				if (existUser.getEmail().equals(emailUser.getEmail())) {
					emailService.sendMail(getServletContext(), emailUser, "forgot");
					req.setAttribute("message", "Đã gửi mật khẩu qua email của bạn! Bạn có thể đăng nhập");
					req.getRequestDispatcher("/views/user/login.jsp").forward(req, resp);
				}else {
					req.setAttribute("message", "Email không thuộc tài khoản này!");
					req.getRequestDispatcher("/views/user/forgot-password.jsp").forward(req, resp);
				}
			}else {
				req.setAttribute("message", "Email không thuộc tài khoản này!");
				req.getRequestDispatcher("/views/user/forgot-password.jsp").forward(req, resp);
			}
		}else {
			req.setAttribute("message", "Tải khoản không tồn tại!");
			req.getRequestDispatcher("/views/user/forgot-password.jsp").forward(req, resp);
		}
		
	}

	private void doPostRegister(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		System.out.println(username);
		System.out.println(password);
		System.out.println(email);
		String confirmPassword = req.getParameter("confirmPassword");
		try {
			if (username.isBlank()) {
				req.setAttribute("message", "Vui lòng nhập Username");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/registration.jsp");
				requestDispatcher.forward(req, resp);
				return;
			} else if (username.length() > 10) {
				req.setAttribute("message", "Username không được dài quá 10 ký tự");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/registration.jsp");
				requestDispatcher.forward(req, resp);
				return;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		try {
			if (password.isBlank()) {
				req.setAttribute("message", "Vui lòng nhập Password");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/registration.jsp");
				requestDispatcher.forward(req, resp);
				return;
			} else if (password.length() > 20) {
				req.setAttribute("message", "Password không được dài quá 20 ký tự");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/registration.jsp");
				requestDispatcher.forward(req, resp);
				return;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		try {
			if (confirmPassword.isBlank()) {
				req.setAttribute("message", "Vui lòng nhập xác nhận mật khẩu");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/registration.jsp");
				requestDispatcher.forward(req, resp);
				return;
			} else if (confirmPassword.length() > 20) {
				req.setAttribute("message", "Xác nhận mật khẩu không được dài quá 20 ký tự");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/registration.jsp");
				requestDispatcher.forward(req, resp);
				return;
			} else if (!password.equals(confirmPassword)) {
				req.setAttribute("message", "Xác nhận mật khẩu không trùng khớp với mật khẩu");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/registration.jsp");
				requestDispatcher.forward(req, resp);
				return;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		try {
			if (email.isBlank()) {
				req.setAttribute("message", "Vui lòng nhập email");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/registration.jsp");
				requestDispatcher.forward(req, resp);
				return;
			} else if (email.length() > 255) {
				req.setAttribute("message", "Email không được dài quá 255 ký tự");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/registration.jsp");
				requestDispatcher.forward(req, resp);
				return;
			} else if (XValidate.checkMail(email)) {
				req.setAttribute("message", "Email không hợp lệ");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/registration.jsp");
				requestDispatcher.forward(req, resp);
				return;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		User user = userService.create(username, password, email);
		
		try {
			if (user != null) {
				emailService.sendMail(getServletContext(), user, "welcome");
				req.getSession().setAttribute(SessionAttribute.CURRENT_USER, user);
				resp.sendRedirect(req.getContextPath() + "/user/index");
			} else {
				resp.sendRedirect(req.getContextPath() +"/account/register");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	private void doPostLogin(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		try {
			if (username.isBlank()) {
				req.setAttribute("message", "Vui lòng nhập Username");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/login.jsp");
				requestDispatcher.forward(req, resp);
				return;
			} else if (username.length() > 10) {
				req.setAttribute("message", "Username không được dài quá 10 ký tự");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/login.jsp");
				requestDispatcher.forward(req, resp);
				return;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		try {
			if (username.isBlank()) {
				req.setAttribute("message", "Vui lòng nhập Password");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/login.jsp");
				requestDispatcher.forward(req, resp);
				return;
			} else if (password.length() > 20) {
				req.setAttribute("message", "Password không được dài quá 20 ký tự");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/login.jsp");
				requestDispatcher.forward(req, resp);
				return;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		User user = userService.login(username, password);
		try {
			if (user != null) {
				req.getSession().setAttribute(SessionAttribute.CURRENT_USER, user);
				resp.sendRedirect(req.getContextPath() + "/user/index");

			} else {
				req.setAttribute("message", "Tài khoản không tồn tại");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/login.jsp");
				requestDispatcher.forward(req, resp);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	private void doGetLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/login.jsp");
		requestDispatcher.forward(req, resp);
	}

	private void doGetLogout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getSession().removeAttribute(SessionAttribute.CURRENT_USER);
		resp.sendRedirect(req.getContextPath() + "/user/index");
	}
	
	private void doGetForgotPassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/forgot-password.jsp");
		requestDispatcher.forward(req, resp);
	}

	protected void doGetRegister(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/registration.jsp");
		requestDispatcher.forward(req, resp);
	}
}
