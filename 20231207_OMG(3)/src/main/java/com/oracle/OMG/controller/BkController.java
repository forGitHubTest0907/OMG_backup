package com.oracle.OMG.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Controller
@Data
@Slf4j
public class BkController {
	
	
	@RequestMapping(value = "logIn")
	public String logIn() {
		return "logIn";
	}
	
	
	@RequestMapping(value = "/forgotPassword")
	public String forgotPassword() {
		
		System.out.println("MainController forgotPassword Start...");
		
		return "forgotPassword";
	}


}
