package com.oracle.OMG.configuration;

import java.util.UUID;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;

import com.oracle.OMG.service.main.MainMemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Component
@Slf4j
public class CustomAuthenticationProvider  implements AuthenticationProvider {
	
	private final MainMemberService MMemberS;
	
	@Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		UUID transactionId = UUID.randomUUID();
		String username = "";
		String password = "";
		try {
			log.info("[{}]{}:{}",transactionId, "AuthenticationProvider", "start");
	        username = authentication.getName();
	        password = authentication.getCredentials().toString();
	        log.info("username:{}",username);
	        log.info("password:{}",password);
//	        MMemberS.memSelectById(mem_id);
//	        if (user == null) {
//	            throw new BadCredentialsException("username is not found. username=" + username);
//	        }
//	        if (!password.equals(user.get().getPassword())) {
//	        	throw new BadCredentialsException("password is not matched");        	
//	        }
	        /* 개발 단계에서는 패스워드 인코딩 생략.
			if (!this.passwordEncoder.matches(password, user.getPassword())) {
				throw new BadCredentialsException("password is not matched");
			}
			*/
//	        userService.updateUserPoint(user.getId(), 9);
		} catch (Exception e) {
			log.error("[{}]{}:{}",transactionId, "AuthenticationProvider", e.getMessage());
			 throw e;  // 추가된 부분
		} finally {
			log.info("[{}]{}:{}",transactionId, "AuthenticationProvider", "end");
		}	        
    	return new UsernamePasswordAuthenticationToken(username, password);
    }

	@Override
	public boolean supports(Class<?> authentication) {
		 return (UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication));
	}
	

}
