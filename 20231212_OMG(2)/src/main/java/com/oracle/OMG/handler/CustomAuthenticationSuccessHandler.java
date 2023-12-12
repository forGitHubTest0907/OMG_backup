package com.oracle.OMG.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

//이 클래스는 Spring Security에서 로그인 성공 후의 동작을 커스터마이징하기 위한 핸들러입니다.
@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	
	// onAuthenticationSuccess 메서드는 로그인 성공 시 호출됩니다.
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
										Authentication authentication) throws IOException, ServletException {
	
		System.out.println("CustomAuthenticationSuccessHandler onAuthenticationSuccess Start...");
		response.sendRedirect(request.getContextPath() + "/main");
	}
		
}
