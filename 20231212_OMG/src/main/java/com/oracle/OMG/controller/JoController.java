package com.oracle.OMG.controller;

import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.OMG.dto.SalesDetail;
import com.oracle.OMG.service.joService.JoSalService;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Data
@Slf4j
@RequestMapping(value = "/sales/*")
public class JoController {
	
	private final JoSalService jss;
	
	@RequestMapping(value = "salesInquiry")
	public String salesInquiry(SalesDetail sales, String currentPage, Model model) {
		UUID transactionId = UUID.randomUUID();
		
		try {
			log.info("[{}]{}:{}", transactionId, "salesInquiry", "Start");
			// int totalSalesInquiry = ss.getTotalSalesInquiry();
			
			// Paging page = new Paging(totalSalesInquiry, currentPage);
			// sales.setStart(page.getStart());
			// sales.setEnd(page.getEnd());
			
			List<SalesDetail> listSalesInquiry = jss.getListSalesInquiry(sales);
			
			// model.addAttribute("totalSalesInquiry", totalSalesInquiry);
			// model.addAttribute("Page", page);
			model.addAttribute("listSalesInquiry", listSalesInquiry);
			model.addAttribute("CurrentPage", currentPage);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		return "jo/salesInquiry";
	}
	
}
