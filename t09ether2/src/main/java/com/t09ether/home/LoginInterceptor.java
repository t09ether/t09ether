package com.t09ether.home;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/*
 * interceptor처리 할 클래스
 * 반드시 HandlerInterceptorAdapter를 상속받아 만들어야 함 
 */

public class LoginInterceptor extends HandlerInterceptorAdapter {
	//컨트롤러가 호출되기 전에 실행된다.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		//로그인 유무를 확인하고 로그인 된 경우 호출한 매핑주소로 이동하고
		//로그인이 안된 경우 로그인 폼으로 실행이 이동되도록 한다.
		HttpSession session = request.getSession();
		
		String logId = (String)session.getAttribute("logId");
		String logStatus = (String)session.getAttribute("logStatus");	// null, "Y"
		
		if(logStatus==null || !logStatus.equals("Y")) { //logStatus가 널이거나 logStatus가 y가 아니라면 로그인이 안되어있는 경우임 -> 하던거 멈추고 로그인으로 보내
			response.sendRedirect(request.getContextPath()+"/loginForm");
			return false;
		}
		
		
		//반환형이 false이면 매핑을 변경하고 
		
		// true이면 매핑을 지속한다.
		return true;
	}
	
	//컨트롤러가 실행 후 View로 이동하기 전에 실행되는 메소드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView mav) throws Exception{
		
	}
	
	//컨트롤러가 실행 후 호출되는 메소드
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, 
			@Nullable Exception ex) throws Exception{
		
	}
}