package com.oracle.OMG.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.OMG.dto.Member;
import com.oracle.OMG.service.bkService.BkMemberService;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;







@Controller
@Data
@Slf4j
public class BkController {
	
	private final BkMemberService bMemberS;
	
	
	@RequestMapping(value = "logIn")
	public String logIn() {
		
		System.out.println("BkController logIn Start...");
		
		return "logIn";
	}
	
	
	
	@RequestMapping(value = "/logOut")
	public String logOut(Member member, HttpSession session) {
		
		System.out.println("BkController logOut Start...");
		System.out.println("BkController logOut session -> " + session);
		session.invalidate();
		System.out.println("BkController logOut session -> " + session);
		
		return "logIn";
	}
	
	
	
	@RequestMapping(value = "/forgotPassword")
	public String forgotPassword() {
		
		System.out.println("BkController forgotPassword Start...");
		
		return "forgotPassword";
	}
	
	
	
	@RequestMapping(value = "/errorPage")
	public String errorPage() {
		
		System.out.println("BkController errorPage Start...");
		
		return "errorPage";
	}
	
	
	
	@RequestMapping(value = "/login")
	public String login(Member member, HttpSession session, HttpServletRequest request, Model model) {
		
		System.out.println("BkController login Start...");
		System.out.println("BkController login member.getMem_id() -> " + member.getMem_id());
		System.out.println("BkController login member.getMem_pw() -> " + member.getMem_pw());
		
		// mapper key:	bkLogin		해당 ID와 PW가 맞는 사원의 정보 모두 조회
		Member loginResult = bMemberS.login(member);
		System.out.println("BkController login loginResult -> " + loginResult);
		
		// 회원 정보가 존재 하는 경우
		if (loginResult != null) {
			
			// 1. 근무 중 사원 -> 로그인 처리
			if(loginResult.getMem_resi() == null) {
				// ?: 인터셉터가 아니라 일반 로그인이면 여기서 세션 담아야 
				session = request.getSession();
				session.setAttribute("mem_id", loginResult.getMem_id());
				session.setAttribute("mem_name", loginResult.getMem_name());
				
				// 세션에 관리자 권한 추가할 지 -> 보류

				
				System.out.println("BkController login session -> " + session);
				// 메인 페이지로 
				return "/main";
				
			} else {
				// 2. 퇴사한 사원
				System.out.println("BkController login loginResult.getMem_resi() -> " + loginResult.getMem_resi());
				
				model.addAttribute("message", "퇴사한 사원입니다");
				return "logIn";
				
			}
			
		} else {
			
			// 3. 회원 정보 없는 경우 (아이디, 비밀번호 틀린 경우)
			model.addAttribute("message", "아이디 또는 비밀번호를 확인해주세요");
			return "logIn";
			
		}
	}
	
	
	
	
	
	


}
