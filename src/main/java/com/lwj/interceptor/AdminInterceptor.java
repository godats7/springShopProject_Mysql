package com.lwj.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.lwj.model.MemberVO;

public class AdminInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		MemberVO loginVO = (MemberVO)session.getAttribute("member");
		
		if(loginVO == null || loginVO.getAdminCk() == 0 ) { // 관리자 계정이 아닌경우
			
			response.sendRedirect("/");
			
			return false;
			
		}
		
		return true;
	}
	
	

}
