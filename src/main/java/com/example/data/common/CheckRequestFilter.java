package com.example.data.common;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.filter.OncePerRequestFilter;

import com.example.data.bean.User;
//过滤器
public class CheckRequestFilter extends OncePerRequestFilter{

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String requestURI = request.getRequestURI();
		String s = request.getRequestURL().toString();
		HttpSession session =  request.getSession();
		User user = (User) session.getAttribute("user");
		String isFirstIn = (String) session.getAttribute("requestURI");
		
		filterChain.doFilter(request, response);
	}


}
