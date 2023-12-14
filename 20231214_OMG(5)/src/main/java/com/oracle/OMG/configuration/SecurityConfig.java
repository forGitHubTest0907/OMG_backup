package com.oracle.OMG.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.oracle.OMG.handler.CustomAuthenticationSuccessHandler;


//1. Spring Security 설정 클래스
@EnableWebSecurity
@Configuration
public class SecurityConfig {
	
	// 2. 로그인 성공 핸들러를 주입
	@Autowired
	private AuthenticationSuccessHandler authenticationSuccessHandler;
	
	public SecurityConfig(AuthenticationSuccessHandler authenticationSuccessHandler) {
		this.authenticationSuccessHandler = authenticationSuccessHandler;
	}
	
	
	// 3. 패스워드 인코더 빈을 등록
	// PasswordEncoder -> 입력된 비밀번호와 데이터 비밀번호 비교
	@Bean
	public BCryptPasswordEncoder  encodePwd() {
		return new BCryptPasswordEncoder();
	}
	
	// 4. Spring Security 설정 메서드
	@Bean
	protected SecurityFilterChain filterChain(HttpSecurity http) throws Exception  {
		// 5. CSRF 보안 설정 비활성화
		http.csrf().disable();
		
		// 6. 권한 설정
		http.authorizeRequests()
		.antMatchers("/main").permitAll() 	// 임시로 모든 권한 허용
		// hasAuthority("ROLE_USER") 	// "/main"에 대한 권한 설정
		    .anyRequest()
		    .permitAll();
		
		// 7. 로그인 설정
		http.formLogin()
			.loginPage("/logIn")										// 로그인 페이지 경로
			.loginProcessingUrl("/logIn")								// 로그인 처리 URL
			.successHandler(authenticationSuccessHandler)	// 로그인 성공 후 핸들러 등록
			.permitAll();
		
		// 8. 로그아웃 설정
		http.logout()
			.logoutUrl("/logout")
			.permitAll();
		
		return http.build();
		
	}
	
}
