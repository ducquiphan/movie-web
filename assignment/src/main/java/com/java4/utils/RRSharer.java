package com.java4.utils;

import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RRSharer {
	private static Map<Long, HttpServletRequest> reqs = new HashMap<>();
	private static Map<Long, HttpServletResponse> resps = new HashMap<>();
	
	public static void add(HttpServletRequest request, HttpServletResponse response) {
		reqs.put(Thread.currentThread().getId(),request);
		resps.put(Thread.currentThread().getId(), response);
		
	}
	
	public static void remove() {
		reqs.remove(Thread.currentThread());
		resps.remove(Thread.currentThread());
	}
	
	public static HttpServletRequest request() {
		return reqs.get(Thread.currentThread().getId());
	}
	
	public static HttpServletResponse response() {
		return resps.get(Thread.currentThread().getId());
	}
}
