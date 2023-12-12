package com.oracle.OMG.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Controller
@Data
@Slf4j
public class YrController {
	
	@RequestMapping(value = "itemList")
	public String itemList() {
		
		
		return "yr/itemList";
	}
}
