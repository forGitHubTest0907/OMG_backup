package com.oracle.OMG.controller.yrController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.oracle.OMG.dto.Criteria;
import com.oracle.OMG.service.thService.ThNoticeService;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Controller
@Data
@Slf4j
public class YrNoticeController {
	private final ThNoticeService ns;
	
	@GetMapping("/mainNotice")
	public String list(Criteria cri, Model model) {
		log.info("/notice/mainNotice");
		cri.setAmount(7);
		model.addAttribute("noticeList", ns.getNoticeList(cri));
		log.info("mainNotice: " + cri);
		return "yr/notice/mainNotice";
	}
}
