package com.java4.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

import com.java4.constant.SessionAttribute;
import com.java4.entity.User;
import com.java4.entity.Video;
import com.java4.service.VideoService;
import com.java4.service.impl.VideoServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet(urlPatterns = {"/admin/video","/admin/video/create","/admin/video/update","/admin/video/delete","/admin/video/reset","/admin/video/edit/*"},name = "VideoControllerOfAdmin")
public class VideoController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7950780023696437767L;
	private static final int VIDEO_MAX_PAGE_SIZE = 4;
	private VideoService videoService = new VideoServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session  = req.getSession();
		User user = (User) session.getAttribute(SessionAttribute.CURRENT_USER);
		if (user != null && user.getIsAdmin() == true) {
			// Video liked
			String uri = req.getRequestURI();
			List<Video> videos = new ArrayList<Video>();
			if (uri.contains("admin/video")) {
				List<Video> countVideos = videoService.findAll();
				int maxPage = (int) Math.ceil(countVideos.size()/(double)VIDEO_MAX_PAGE_SIZE );
				req.setAttribute("maxPage", maxPage);
				String pageNumber = req.getParameter("page");
				
				if (pageNumber == null) {
					videos = videoService.findAll(1, VIDEO_MAX_PAGE_SIZE);
					req.setAttribute("currentPage", 1);
				}else {
					videos = videoService.findAll(Integer.parseInt(pageNumber), VIDEO_MAX_PAGE_SIZE);
					req.setAttribute("currentPage", Integer.parseInt(pageNumber));
				}
				
			}
			if (uri.contains("edit")) {
				System.out.println(uri);
				doGetEdit(req, resp, uri);
			}else if (uri.contains("edit")) {
				doGetReset(req, resp);
			}
			req.setAttribute("url", req.getContextPath());
			req.setAttribute("videos", videos);
			req.getRequestDispatcher("/views/admin/video-manage.jsp").forward(req, resp);
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
			if (uri.contains("create")) {
				//create
				doPostCreate(req, resp);
			}else if (uri.contains("update")) {
				//update
				doPostUpdate(req, resp);
			}else if (uri.contains("delete")) {
				//delete
				doPostDelete(req, resp);
			}	
			List<Video> videos = videoService.findAll();
			List<Video> countVideos = videoService.findAll();
			int maxPage = (int) Math.ceil(countVideos.size()/(double)VIDEO_MAX_PAGE_SIZE );
			req.setAttribute("maxPage", maxPage);
			String pageNumber = req.getParameter("page");
			
			if (pageNumber == null) {
				videos = videoService.findAll(1, VIDEO_MAX_PAGE_SIZE);
				req.setAttribute("currentPage", 1);
			}else {
				videos = videoService.findAll(Integer.parseInt(pageNumber), VIDEO_MAX_PAGE_SIZE);
				req.setAttribute("currentPage", Integer.parseInt(pageNumber));
			}
			req.setAttribute("url", req.getContextPath());
			req.setAttribute("videos", videos);
			req.getRequestDispatcher("/views/admin/video-manage.jsp").forward(req, resp);
		} else {
			resp.sendRedirect(req.getContextPath() + "/user/index");
		}	
	}
	
	private void doGetEdit(HttpServletRequest request, HttpServletResponse response, String uri) {
		System.out.println(uri);
		String link = uri.substring(uri.lastIndexOf("/")+1);
		System.out.println(link);
		Video video = videoService.findByVideoLink(link);
		request.setAttribute("video", video);
	}
	
	private void doPostCreate(HttpServletRequest request, HttpServletResponse response) {
		try {
			Video video = new Video();
			BeanUtils.populate(video, request.getParameterMap());
			if (video.getTitle().isBlank()) {
				request.setAttribute("message", "Tiêu đề không được để trống!");
				return;
			}
			if (video.getVideo().isBlank()) {
				request.setAttribute("message", "Link video không được để trống!");
				return;
			}
			if (video.getPoster().isBlank()) {
				request.setAttribute("message", "Poster không được để trống!");
				return;
			}
			if (video.getDescription().isBlank()) {
				request.setAttribute("message", "Mô tả không được để trống!");
				return;
			}
			Video existedVideo = videoService.findByVideoLink(video.getVideo());
			if (existedVideo != null) {
				request.setAttribute("message", "Video này đã tồn tại!");
				return;
			}
			videoService.create(video);
			request.setAttribute("message", "Thêm mới thành công");
		} catch (Exception e) {
			// TODO: handle exception
			request.setAttribute("message", "Thêm mới thất bại");
			e.printStackTrace();
		}
	}
	
	private void doPostUpdate(HttpServletRequest request, HttpServletResponse response) {
		try {
			Integer id = Integer.parseInt(request.getParameter("id"));
			Video video = videoService.findById(id);
			BeanUtils.populate(video, request.getParameterMap());
			if (video.getTitle().isBlank()) {
				request.setAttribute("message", "Tiêu đề không được để trống!");
				return;
			}
			if (video.getVideo().isBlank()) {
				request.setAttribute("message", "Link video không được để trống!");
				return;
			}
			if (video.getPoster().isBlank()) {
				request.setAttribute("message", "Poster không được để trống!");
				return;
			}
			if (video.getDescription().isBlank()) {
				request.setAttribute("message", "Mô tả không được để trống!");
				return;
			}
			videoService.update(video);
			request.setAttribute("message", "Cập nhật thành công");
		} catch (Exception e) {
			// TODO: handle exception
			request.setAttribute("message", "Cập nhật thất bại");
			e.printStackTrace();
		}
	}
	
	private void doPostDelete(HttpServletRequest request, HttpServletResponse response) {
		try {
			String id = request.getParameter("id");
			Video videoDelete = videoService.findById(Integer.parseInt(id));
			videoService.delete(videoDelete.getVideo());
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
