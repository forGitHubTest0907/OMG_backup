package com.oracle.OMG.service.bkService;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

// HandlerInterceptor 인터페이스를 구현한 BkAuthInterceptor 클래스  
public class BkDeptInterceptor implements HandlerInterceptor {
	
	
	// 각 권한에 대한 허용된 페이지를 매핑하는 Map
	private static final Map<String, String[]> DEPT_PAGE_MAP = new HashMap<>();
	
	static {
		// 각 권한에 대한 허용된 부서별 페이지 등록						/**: 와일드카드 패턴. 특정 경로 및 하위 경로에 대한 일치
		// DEPT_PAGE_MAP.put("101", new String[] {"/memberL/**"});		// 101 인사팀
	}
	
	
	
	// 컨트롤러 메소드가 실행되기 전
	@Override
	public boolean preHandle(HttpServletRequest request, 
							  HttpServletResponse response, 
							  Object handler) throws Exception {
		
		System.out.println("BkDeptInterceptor preHandler Start...");
		System.out.println("[Controller Method 호출 전]");
		System.out.println("[" + request.getMethod() + "]");
		System.out.println("[" + request.getRequestURL() + "]");
		System.out.println("[" + request.getRequestURI() + "]");
		
		HttpSession session = request.getSession();
		String userRole = (String) request.getSession().getAttribute("userRole");
		String requestUri = request.getRequestURI();
		
		// 사용자의 권한에 해당하는 허용된 페이지를 가져오기
		String[] allowedPages = DEPT_PAGE_MAP.get(userRole);
		
		// 로그인 여부 확인 -> 로그인 전이면 로그인 페이지로 이동
		int userNum = 0;
		System.out.println("session.getAttribute(\"mem_dept_lg\") -> " + session.getAttribute("mem_dept_lg"));
		System.out.println("session.getAttribute(\"mem_id\") -> " + session.getAttribute("mem_id"));
		
		// 세션에 담긴 사원 번호가 없다면 홈으로 이동
		if(session.getAttribute("mem_id") == null) {
			System.out.println("세션에 담긴 사원 정보 없음");
			response.sendRedirect("/logIn");
			return false;
			
		// 세션에 담긴 사원 정보가 있다면
		} else {
			
			// 세션에 담긴 유저 부서 확인: 허용된 페이지가 없거나, 현재 요청한 페이지가 허용된 페이지 목록에 포함되어 있지 않으면 
			if(allowedPages == null || !isPageAllowed(requestUri, allowedPages)) {
				response.sendRedirect("/bk/403forbidden");	// 403 페이지로 리다이렉트
				return false;	// 컨트롤러 메소드 실행 중지
				
			// 권한이 있으면 정상적으로 진행
			} else {
				System.out.println("부서 권한 확인됨");
				return true;
			}
		} 
	}
	
	
	
	private boolean isPageAllowed(String requestedPage, String[] allowedPages) {
		for (String allowedPage : allowedPages) {
			if (requestedPage.startsWith(allowedPage)) {
				return true;
			}
		}
		
		return false;
	}
	
	
	
	@Override
	public void postHandle(HttpServletRequest request, 
							HttpServletResponse response,
							Object handler,
							ModelAndView modelAndView) throws Exception {
		
		System.out.println("BkDeptInterceptor postHandler Start...");
		
	}

}
