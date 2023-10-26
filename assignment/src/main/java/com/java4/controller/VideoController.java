package com.java4.controller;

import java.io.IOException;
import java.util.List;

import com.java4.constant.SessionAttribute;
import com.java4.entity.History;
import com.java4.entity.User;
import com.java4.entity.Video;
import com.java4.service.EmailService;
import com.java4.service.HistoryService;
import com.java4.service.VideoService;
import com.java4.service.impl.EmailServiceImpl;
import com.java4.service.impl.HistoryServiceImpl;
import com.java4.service.impl.VideoServiceImpl;
import com.java4.utils.XValidate;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/video")
public class VideoController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7437999414340634710L;
	
	private VideoService videoService = new VideoServiceImpl();
	
	private HistoryService historyService = new HistoryServiceImpl();
	private EmailService emailService = new EmailServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String actionParam = req.getParameter("action");
		String videoLink = req.getParameter("id");
		
		switch (actionParam) {
		case "watch": {
			doGetWatch(videoLink, req, resp);
			break;
		}
		case "share": {
			doGetShare(videoLink, req, resp);
			break;
		}
		case "like":{
			doGetLike(videoLink, req, resp);
			break;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + actionParam);
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String actionParam = req.getParameter("action");
		String videoLink = req.getParameter("id");
		
		switch (actionParam) {
		case "share": {
			doPostShare(videoLink, req, resp);
			break;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + actionParam);
		}
	}

	private void doPostShare(String videoLink, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = req.getParameter("email");
		try {
			if (email.isBlank()) {
				req.setAttribute("message", "Vui lòng nhập email");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/share.jsp");
				requestDispatcher.forward(req, resp);
				return;
			} else if (email.length() > 255) {
				req.setAttribute("message", "Email không được dài quá 255 ký tự");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/share.jsp");
				requestDispatcher.forward(req, resp);
				return;
			} else if (XValidate.checkMail(email)) {
				req.setAttribute("message", "Email không hợp lệ");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/share.jsp");
				requestDispatcher.forward(req, resp);
				return;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		String link = "http://localhost:8080/assignment/video?action=watch&id="+videoLink;
		User user = (User) req.getSession().getAttribute(SessionAttribute.CURRENT_USER);
		emailService.sendMail(getServletContext(), user, email, link);
		req.setAttribute("message", "Chia sẻ video thành công");
		req.setAttribute("url", req.getContextPath());
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/share.jsp");
		requestDispatcher.forward(req, resp);
	}

	// localhost:8080/assignment/video?action=watch&id={videoLink}
	private void doGetWatch(String videoLink, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Video> list = videoService.findAll(1, 6);
		
		Video video = videoService.findByVideoLink(videoLink);
		req.setAttribute("video", video);
		req.setAttribute("suggestList", list);
		req.setAttribute("url", req.getContextPath());
		
		User currentUser = (User) req.getSession().getAttribute(SessionAttribute.CURRENT_USER);
		
		if (currentUser != null) {
			History history = historyService.create(currentUser, video);
			req.setAttribute("flagLikedBtn", history.getIsLiked());
		}
		req.setAttribute("url", req.getContextPath());
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/detail.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	private void doGetShare(String videoLink, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Video video = videoService.findByVideoLink(videoLink);
		req.setAttribute("video", video);	
		req.setAttribute("url", req.getContextPath());
		
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/share.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	// localhost:8080/assignment/video?action=like&id={videoLink}
	private void doGetLike(String videoLink, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User currentUser = (User) req.getSession().getAttribute(SessionAttribute.CURRENT_USER);
		Boolean result = historyService.updateLikeOrUnlike(currentUser, videoLink);
		List<Video> list = videoService.findAll(1, 6);
		
		Video video = videoService.findByVideoLink(videoLink);
		req.setAttribute("video", video);
		req.setAttribute("suggestList", list);
		req.setAttribute("url", req.getContextPath());
		if (currentUser != null) {
			History history = historyService.findByUserIdAndVideoId(currentUser.getId(), video.getId());
			req.setAttribute("flagLikedBtn", history.getIsLiked());
		}
		
		req.getRequestDispatcher("/views/user/detail.jsp").forward(req, resp);
	}
	
}
