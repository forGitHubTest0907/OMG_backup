package com.oracle.OMG.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.oracle.OMG.service.bkService.BkDeptInterceptor;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {

	// addInterceptors 메서드 오버라이드: 이 메서드를 사용하여 인터셉터를 등록합니다.
	// 								알아서 떠서 bean 안해도 됨
	@Override										// 인터셉터 하는 저장소
	public void addInterceptors(InterceptorRegistry registry) {
		// 누군가 URL	/	interCeptor -> BkAuthInterceptor() 처리해줌
		registry.addInterceptor(new BkDeptInterceptor()).addPathPatterns("/memberL");	// 승현 - 사원리스트 페이지		200 - 101(인사팀)
	}
}
