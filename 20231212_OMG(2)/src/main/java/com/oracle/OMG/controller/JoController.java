package com.oracle.OMG.controller;

import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.OMG.dto.SalesDetail;
import com.oracle.OMG.service.joService.JoSalService;
import com.oracle.OMG.service.joService.Paging;

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
			int totalSalesInquiry = jss.getTotalSalesInquiry();
			
			Paging page = new Paging(totalSalesInquiry, currentPage);
			sales.setStart(page.getStart());
			sales.setEnd(page.getEnd());
			
			List<SalesDetail> listSalesInquiry = jss.getListSalesInquiry(sales);
			
			model.addAttribute("totalSalesInquiry", totalSalesInquiry);
			model.addAttribute("page", page);
			model.addAttribute("listSalesInquiry", listSalesInquiry);
			model.addAttribute("currentPage", currentPage);
			
		} catch (Exception e) {
			log.error("[{}]{}:{}", transactionId, "salesInquiry", e.getMessage());
		} finally {
			log.info("[{}]{}:{}", transactionId, "salesInquriry", "End");
		}
				
		return "jo/salesInquiry";
	}
	
	
	@RequestMapping("salesInquirySearch")
	public String salesInquirySearch(SalesDetail sales, String currentPage, Model model) {
		UUID transactionId = UUID.randomUUID();
		
		try {
			log.info("[{}]{}:{}", transactionId, "salesInquirySearch", "Start");
			int SearchTotalSalesInquiry = jss.getSearchTotalSalesInquiry();
			String search  = sales.getSearch();
			String keyword = sales.getKeyword();
					
			Paging page = new Paging(SearchTotalSalesInquiry, currentPage); 
			sales.setStart(page.getStartPage());
			sales.setEnd(page.getEnd());
						
			List<SalesDetail> salesInquirySearch = jss.searchSalesInquiry(sales);
			
			model.addAttribute("SearchTotalSalesInquiry", SearchTotalSalesInquiry);
			model.addAttribute("search", search);
			model.addAttribute("keyword", keyword);
			model.addAttribute("page", page);
			model.addAttribute("salesInquirySearch", salesInquirySearch);
			model.addAttribute("currentPage", currentPage);
		
		} catch (Exception e) {
			log.error("[{}]{}:{}", transactionId, "salesInquirySearch", e.getMessage());
		} finally {
			log.info("[{}]{}:{}", transactionId, "salesInqurirySearch", "End");
		}

		return "jo/salesInquirySearch";
	}
	
	
	@RequestMapping("salesInquirySort")
	public String salesInquirySort(SalesDetail sales, int sales_status, String currentPage, Model model) {
		UUID transactionId = UUID.randomUUID();
		
		try {
			log.info("[{}]{}:{}", transactionId, "salesInquirySort", "Start");
			int SortTotalSalesInquiry = jss.getSortTotalSalesInquiry();
								
			Paging page = new Paging(SortTotalSalesInquiry, currentPage); 
			sales.setStart(page.getStartPage());
			sales.setEnd(page.getEnd());
						
			List<SalesDetail> salesInquirySort = jss.sortSalesInquiry(sales_status);
			
			model.addAttribute("sortTotalSalesInquiry", SortTotalSalesInquiry);
			model.addAttribute("page", page);
			model.addAttribute("salesInquirySort", salesInquirySort);
			model.addAttribute("currentPage", currentPage);
		
		} catch (Exception e) {
			log.error("[{}]{}:{}", transactionId, "salesInquirySort", e.getMessage());
		} finally {
			log.info("[{}]{}:{}", transactionId, "salesInqurirySort", "End");
		}

		return "jo/salesInquirySort";
	}

}
