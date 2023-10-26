package com.java4.utils;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

@WebListener
public class AppListener implements HttpSessionListener, ServletContextListener {
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Ghi số đếm trong application scope vào file
		ServletContext application = sce.getServletContext();
		Integer visitors = (Integer) application.getAttribute("visitors");
		try {
			String path = application.getRealPath("/visitors.txt");
			byte[] data = String.valueOf(visitors).getBytes();
			Files.write(Paths.get(path), data, StandardOpenOption.CREATE);
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Đọc số đếm trước đây từ file vào application scope
		ServletContext application = sce.getServletContext();
		Integer visitors = 0;
		try {
			String path = application.getRealPath("/visitors.txt"); // đặt tại webroot
			List<String> lines = Files.readAllLines(Paths.get(path));
			visitors = Integer.valueOf(lines.get(0));
		} catch (Exception e2) {
			visitors = 28062000; // khởi đầu số khách
		}
		application.setAttribute("visitors", visitors);
	}
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Tăng số đếm trong application scope lên một
		HttpSession session = se.getSession();
		ServletContext application = session.getServletContext();
		Integer visitors = (Integer) application.getAttribute("visitors");
		application.setAttribute("visitors", visitors + 1);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
	}
}
