package com.oracle.OMG.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.oracle.OMG.service.bkService.BkAuthInterceptor;
import com.oracle.OMG.service.bkService.BkDeptInterceptor;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {

	// addInterceptors 메서드 오버라이드: 이 메서드를 사용하여 인터셉터를 등록합니다.
	// 								알아서 떠서 bean 안해도 됨
	@Override										// 인터셉터 하는 저장소
	public void addInterceptors(InterceptorRegistry registry) {
		// 누군가 URL	/	interCeptor -> BkAuthInterceptor() 처리해줌
		
									// 특정 경로에 로그인 안한 사용자가 접근했는지 체크하는 
		registry.addInterceptor(new BkAuthInterceptor()).addPathPatterns("/");
		
									// 로그인 성공 시 이전 페이지 돌아가기
		// registry.addInterceptor(new BkLoginInterceptor()).addPathPatterns("/logIn");
		
		registry.addInterceptor(new BkDeptInterceptor()).addPathPatterns("/memberL");	// 승현 - 사원리스트 페이지		200 - 101(인사팀)
		
	}
}
