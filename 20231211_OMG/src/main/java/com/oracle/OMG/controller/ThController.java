package com.oracle.OMG.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Controller
@Data
@Slf4j
public class ThController {
	
	@GetMapping("/noticeList")
	public String noticeList(){
		System.out.println("ThController noticeList Start...");
		return "th/noticeList";
	}
	
	@GetMapping("/QnAList")
	public String QnAList(){
		System.out.println("ThController QnAList Start...");
		return "th/QnAList";
	}
}
