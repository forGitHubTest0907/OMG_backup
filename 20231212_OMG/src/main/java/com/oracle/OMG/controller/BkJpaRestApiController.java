package com.oracle.OMG.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.OMG.domain.Member;
import com.oracle.OMG.repository.BkMemberJpaRepository;
import com.oracle.OMG.service.bkService.BkMemberJpaService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
@Slf4j
public class BkJpaRestApiController {
	
	private BkMemberJpaService	BMemberJpaS;
	
	// PasswordEncoder -> 입력된 비밀번호와 데이터 비밀번호 비교
	private PasswordEncoder		passwordEncoder;
	
	@PostMapping("/login")
	public ResponseEntity<String> loginMember(@RequestBody Member member) {
		// 사용자 검증 로직 수행 (아이디, 비밀번호 확인)
		Member foundMember = BMemberJpaS.findByMemberId(member.getMem_id());
		
		// 조회된 사용자가 존재하고, 입력된 비밀번호가 저장된 비밀번호와 일치하는 경우
		if (foundMember != null && passwordEncoder.matches(member.getMem_pw(), foundMember.getMem_pw())) {
			// 로그인 성공 응답 반환
			return ResponseEntity.ok("로그인 되었습니다");
		} else {
			// 사용자 이름 또는 비밀번호가 잘못된 경우, UNAUTHORIZED(401) 상태와 함께 메시지 반환
			// UNAUTHORIZED -> 권한 없음
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("잘못된 사용자 이름 또는 비밀번호 입니다");
		}
	}

}
