package com.java4.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

import com.java4.constant.SessionAttribute;
import com.java4.entity.User;
import com.java4.entity.Video;
import com.java4.service.UserService;
import com.java4.service.impl.UserServiceImpl;
import com.java4.utils.XValidate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/admin/user","/admin/user/update","/admin/user/delete","/admin/user/edit/*"},name = "UserControllerOfAdmin")
public class UserController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7950780023696437767L;
	private static final int VIDEO_MAX_PAGE_SIZE = 10;
	private UserService userService = new UserServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session  = req.getSession();
		User user = (User) session.getAttribute(SessionAttribute.CURRENT_USER);
		if (user != null && user.getIsAdmin() == true) {
			// Video liked
			String uri = req.getRequestURI();
			List<User> users = new ArrayList<User>();
			if (uri.contains("admin/user")) {
				List<User> countUsers = userService.findAll();
				int maxPage = (int) Math.ceil(countUsers.size()/(double)VIDEO_MAX_PAGE_SIZE );
				req.setAttribute("maxPage", maxPage);
				String pageNumber = req.getParameter("page");
				
				if (pageNumber == null) {
					users = userService.findAll(1, VIDEO_MAX_PAGE_SIZE);
					req.setAttribute("currentPage", 1);
				}else {
					users = userService.findAll(Integer.parseInt(pageNumber), VIDEO_MAX_PAGE_SIZE);
					req.setAttribute("currentPage", Integer.parseInt(pageNumber));
				}
				
			}
			if (uri.contains("edit")) {
				doGetEdit(req, resp, uri);
			}else if (uri.contains("edit")) {
				doGetReset(req, resp);
			}
			req.setAttribute("url", req.getContextPath());
			req.setAttribute("users", users);
			req.getRequestDispatcher("/views/admin/user-manage.jsp").forward(req, resp);
		} else {
			resp.sendRedirect(req.getContextPath() + "/user/index");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session  = req.getSession();
		User user = (User) session.getAttribute(SessionAttribute.CURRENT_USER);
		if (user != null && user.getIsAdmin() == true) {
			// Video liked
			String uri = req.getRequestURI();
			if (uri.contains("update")) {
				//update
				doPostUpdate(req, resp);
			}else if (uri.contains("delete")) {
				//delete
				doPostDelete(req, resp);
			}	
			List<User> users = userService.findAll();
			List<User> countUsers = userService.findAll();
			int maxPage = (int) Math.ceil(countUsers.size()/(double)VIDEO_MAX_PAGE_SIZE );
			req.setAttribute("maxPage", maxPage);
			String pageNumber = req.getParameter("page");
			
			if (pageNumber == null) {
				users = userService.findAll(1, VIDEO_MAX_PAGE_SIZE);
				req.setAttribute("currentPage", 1);
			}else {
				users = userService.findAll(Integer.parseInt(pageNumber), VIDEO_MAX_PAGE_SIZE);
				req.setAttribute("currentPage", Integer.parseInt(pageNumber));
			}
			req.setAttribute("url", req.getContextPath());
			req.setAttribute("users", users);
			req.getRequestDispatcher("/views/admin/user-manage.jsp").forward(req, resp);
		} else {
			resp.sendRedirect(req.getContextPath() + "/user/index");
		}	
	}
	
	private void doGetEdit(HttpServletRequest request, HttpServletResponse response, String uri) {
		String username = uri.substring(uri.lastIndexOf("/")+1);
		User user = userService.findByUsername(username);
		request.setAttribute("user", user);
	}
	
	private void doPostUpdate(HttpServletRequest request, HttpServletResponse response) {
		try {
			String username = request.getParameter("username");
			User user = userService.findByUsername(username);
			BeanUtils.populate(user, request.getParameterMap());
			if (user.getEmail().isBlank()) {
				request.setAttribute("message", "Vui lòng nhập email");
				return;
			} else if (user.getEmail().length() > 255) {
				request.setAttribute("message", "Email không được dài quá 255 ký tự");
				return;
			} else if (XValidate.checkMail(user.getEmail())) {
				request.setAttribute("message", "Email không hợp lệ");
				return;
			}
			userService.update(user);
			request.setAttribute("message", "Cập nhật thành công");
		} catch (Exception e) {
			// TODO: handle exception
			request.setAttribute("message", "Cập nhật thất bại");
			e.printStackTrace();
		}
	}
	
	private void doPostDelete(HttpServletRequest request, HttpServletResponse response) {
		try {
			String username = request.getParameter("username");
			User user = userService.findByUsername(username);
			userService.delete(user.getUsername());
			request.setAttribute("message", "Xóa thành công");
		} catch (Exception e) {
			// TODO: handle exception
			request.setAttribute("message", "Xóa thất bại");
			e.printStackTrace();
		}
	}
	private void doGetReset(HttpServletRequest request, HttpServletResponse response) {
		Video video = new Video();
		request.setAttribute("video", video);
	}
}
