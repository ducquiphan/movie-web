package com.java4.controller.admin;

import java.io.IOException;
import java.util.List;

import com.java4.constant.SessionAttribute;
import com.java4.dto.VideoLikedInfo;
import com.java4.entity.Report;
import com.java4.entity.User;
import com.java4.entity.Video;
import com.java4.service.HistoryService;
import com.java4.service.ReportService;
import com.java4.service.StatisticService;
import com.java4.service.VideoService;
import com.java4.service.impl.HistoryServiceImpl;
import com.java4.service.impl.ReportServiceImpl;
import com.java4.service.impl.StatisticServiceImpl;
import com.java4.service.impl.VideoServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/admin/reports" }, name = "HomeControllerOfAdmin")
public class HomeController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1672833033433878897L;
	
	private StatisticService statisticService = new StatisticServiceImpl();
	private ReportService reportService = new ReportServiceImpl();
	private VideoService videoService = new VideoServiceImpl();
	private HistoryService historyService = new HistoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute(SessionAttribute.CURRENT_USER);
		req.setAttribute("url", req.getContextPath());
		if (user != null && user.getIsAdmin() == true) {
			// Video liked
			List<Video> videos = videoService.findAll();
			req.setAttribute("videos", videos);
			
			List<VideoLikedInfo> videoLikedInfos = statisticService.findVideoLikedInfos();
			req.getSession().setAttribute("videoLikedInfos", videoLikedInfos);
			req.getRequestDispatcher("/views/admin/statistic.jsp").forward(req, resp);
		} else {
			resp.sendRedirect(req.getContextPath() + "/user/index");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute(SessionAttribute.CURRENT_USER);
		req.setAttribute("url", req.getContextPath());
		if (user != null && user.getIsAdmin() == true) {
			// Users liked videos
			List<Video> videos = videoService.findAll();
			req.setAttribute("videos", videos);
			String chosenLink = req.getParameter("videoLink");
			List<Report> reports = reportService.findUsersLikedByVideoLink(chosenLink);
			req.setAttribute("reports", reports);
			req.setAttribute("chosenVideo", chosenLink);
			
			// Video liked
			List<VideoLikedInfo> videoLikedInfos = statisticService.findVideoLikedInfos();
			req.getSession().setAttribute("videoLikedInfos", videoLikedInfos);
			req.getRequestDispatcher("/views/admin/statistic.jsp").forward(req, resp);
		} else {
			resp.sendRedirect(req.getContextPath() + "/user/index");
		}
	}
}
