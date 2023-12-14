package com.oracle.OMG.controller;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Controller
@Data
@Slf4j
public class ShController {
	
	@RequestMapping(value = "/")
	public String main() {
		return "main";
	}

	@RequestMapping(value = "memberR")
	public String memberRegistration() {
		return "sh/memberRegistration";
	}
	
	@RequestMapping(value = "memberU")
	public String memberUpdate() {
		return "sh/memberUpdate";
	}
	
	@RequestMapping(value = "memberL")
	public String memberList() {
		return "sh/memberList";
	}
	
	@RequestMapping(value = "example")
	public String example() {
		return "example";
	}
	
	@RequestMapping(value = "pwdCheck")
	public String pwdCheck(@RequestParam("userPwd") String userPwd, Model model) {
		//결과값 들어갈 변수
		String result = "";
		
		//특정 문구 제한
		if(userPwd.contains("1004")||userPwd.contains("8282")||userPwd.contains("abc123")) {
			System.out.println("위험 - 특정 문구 포함 불가");
			result = "2";
		} else if(userPwd.matches("^[a-zA-Z]*$")||userPwd.matches("^[0-9]*$")){
			System.out.println("보통 - 영문자, 숫자만 있을 경우");
			result = "3";
		} else {
			System.out.println("안전 - 영문자, 숫자, 특수문자 중 2개 이상 조합");
			result = "4";
		}
		return result;
	}
}
