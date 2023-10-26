package com.java4.controller;

import java.io.IOException;
import java.util.List;

import com.java4.constant.SessionAttribute;
import com.java4.entity.History;
import com.java4.entity.User;
import com.java4.entity.Video;
import com.java4.service.HistoryService;
import com.java4.service.VideoService;
import com.java4.service.impl.HistoryServiceImpl;
import com.java4.service.impl.VideoServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/user/index", "/user/favorites", "" })
public class HomeController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private VideoService videoService = new VideoServiceImpl();
	private HistoryService historyService = new HistoryServiceImpl();
	private static final int VIDEO_MAX_PAGE_SIZE = 6;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = req.getServletPath(); // get after project name
		String actionParam = req.getParameter("action");
		String videoLink = req.getParameter("id");
		if (actionParam != null || videoLink != null) {
			if (actionParam.contains("like")) {
				doGetLike(videoLink, req, resp);
				return;
			}
		}
		try {
			switch (path) {
			case "/user/index": {
				doGetIndex(req, resp);
				break;
			}
			case "/user/favorites": {
				doGetFavorites(req, resp);
				break;

			}
			default:
				throw new IllegalArgumentException("Unexpected value: " + path);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	private void doGetLike(String videoLink, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("videoLink");
		User currentUser = (User) req.getSession().getAttribute(SessionAttribute.CURRENT_USER);
		historyService.updateLikeOrUnlike(currentUser, videoLink);
		Video video = videoService.findByVideoLink(videoLink);
		req.setAttribute("url", req.getContextPath());
		List<History> histories = historyService.findByUserAndIsLiked(currentUser.getUsername());
		req.setAttribute("histories", histories);
		req.getRequestDispatcher("/views/user/favorite.jsp").forward(req, resp);
	}

	private void doGetFavorites(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user = (User) req.getSession().getAttribute(SessionAttribute.CURRENT_USER);
		List<History> histories = historyService.findByUserAndIsLiked(user.getUsername());
		req.setAttribute("histories", histories);
		req.getRequestDispatcher("/views/user/favorite.jsp").forward(req, resp);
	}

	private void doGetIndex(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Video> countVideos = videoService.findAll();
		int maxPage = (int) Math.ceil(countVideos.size() / (double) VIDEO_MAX_PAGE_SIZE);
		req.setAttribute("maxPage", maxPage);

		List<Video> videos;
		String pageNumber = req.getParameter("page");

		if (pageNumber == null) {
			videos = videoService.findAll(1, VIDEO_MAX_PAGE_SIZE);
			req.setAttribute("currentPage", 1);
		} else {
			videos = videoService.findAll(Integer.parseInt(pageNumber), VIDEO_MAX_PAGE_SIZE);
			req.setAttribute("currentPage", Integer.parseInt(pageNumber));
		}

		req.setAttribute("videos", videos);
		req.getRequestDispatcher("/views/user/index.jsp").forward(req, resp);

	}
}
