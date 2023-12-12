package com.oracle.OMG.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.OMG.dto.Warehouse;
import com.oracle.OMG.service.jkService.JkWareService;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Controller
@Data
@Slf4j
public class JkController {
	private static final Logger logger = LoggerFactory.getLogger(JkController.class);
	private final JkWareService jws;
	
	// 기초재고등록
	@RequestMapping(value="/invRegister")
	public String invRegister(HttpSession session) {
		System.out.println("JkController invRegister start...");
	
		
		return "jk/invRegister";
		}
	
	// 월별 재고리스트 조회

	@GetMapping("/monthData")
	@ResponseBody
	public List<Warehouse> monthData(@RequestParam(name = "month") String month, @RequestParam(name = "invType", required = false) String invType) {
	    System.out.println("JkController monthData start....");
	    logger.info("Received month: {}", month);
	    logger.info("Received invType: {}", invType);

	    Map<String, String> params = new HashMap<>();
	    params.put("month", month);
	    params.put("invType", invType);

	    List<Warehouse> monthData = jws.monthData(params);
	    logger.info("JkController monthData.size(): {}", monthData.size());

	    return monthData;
	}



}
