package com.oracle.OMG.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.OMG.dto.Comm;
import com.oracle.OMG.dto.Purchase;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Controller
@Data
@Slf4j
public class ChController {
	
	@RequestMapping("purList")
	public String purList(Model model) {
		System.out.println("ChController purList Start...");
		List<Purchase>purList = null;
		
		
		
		
		model.addAttribute("purList",purList);
		
		return "ch/purList";
	}
	
}
