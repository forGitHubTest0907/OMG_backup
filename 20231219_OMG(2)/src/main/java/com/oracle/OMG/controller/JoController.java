package com.oracle.OMG.controller;

import java.net.http.HttpRequest;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

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
@RequestMapping(value = "/sales")
public class JoController {
	
	private final JoSalService jss;
	
	// 판매서 조회
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
	
	
	// 판매서 검색 -> 거래처 or 제품
	@RequestMapping("salesInquirySearch")
	public String salesInquirySearch(SalesDetail sales, String currentPage, Model model) {
		UUID transactionId = UUID.randomUUID();
		
		try {
			log.info("[{}]{}:{}", transactionId, "salesInquirySearch", "Start");
			String search  = sales.getSearch();
			String keyword = sales.getKeyword();
			
			int SearchTotalSalesInquiry = jss.getSearchTotalSalesInquiry(sales);
			
			Paging page = new Paging(SearchTotalSalesInquiry, currentPage); 
			sales.setStart(page.getStart());
			sales.setEnd(page.getEnd());
			
			List<SalesDetail> salesInquirySearch = jss.searchSalesInquiry(sales);
			
			model.addAttribute("search", search);
			model.addAttribute("keyword", keyword);
			model.addAttribute("SearchTotalSalesInquiry", SearchTotalSalesInquiry);
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
	
	
	// 판매서 분류 -> 전체,진행,취소,완료,출고등록
	@RequestMapping("salesInquirySort")
//	public String salesInquirySort(SalesDetail sales, int sales_status, String currentPage, Model model, HttpServletRequest request) {
	public String salesInquirySort(SalesDetail sales, String currentPage, Model model, HttpServletRequest request) {
		UUID transactionId = UUID.randomUUID();
		
		try {
			log.info("[{}]{}:{}", transactionId, "salesInquirySort", "Start");
			// sales_status = Integer.parseInt(request.getParameter("sales_status"));
			log.info("sales_status -> " + sales.getSales_status());
			int SortTotalSalesInquiry = jss.getSortTotalSalesInquiry(sales.getSales_status());
								
			Paging page = new Paging(SortTotalSalesInquiry, currentPage); 
			sales.setStart(page.getStart());
			sales.setEnd(page.getEnd());
			// Target		
			//  List<SalesDetail> salesInquirySort = jss.sortSalesInquiry(sales_status);
			// sales.setSales_status(sales_status);  
			List<SalesDetail> salesInquirySort = jss.sortSalesInquiry(sales);
			
			model.addAttribute("sortTotalSalesInquiry", SortTotalSalesInquiry);
			model.addAttribute("page", page);
			model.addAttribute("salesInquirySort", salesInquirySort);
			model.addAttribute("sales_status", sales.getSales_status());
			model.addAttribute("currentPage", currentPage);
		
		} catch (Exception e) {
			log.error("[{}]{}:{}", transactionId, "salesInquirySort", e.getMessage());
		} finally {
			log.info("[{}]{}:{}", transactionId, "salesInqurirySort", "End");
		}

		return "jo/salesInquirySort";
	}

	// 판매서 삭제
	@RequestMapping("salesDetailDelete")
	public String salesDetailDelete(SalesDetail sales, String currentPage, Model model) {
		UUID transactionId = UUID.randomUUID();
		
		try {
			log.info("[{}]{}:{}", transactionId, "salesInquiryDelete", "Start");
			int result = jss.deleteSalesDetail(sales);
			
		} catch (Exception e) {
			log.error("[{}]{}:{}", transactionId, "salesDetailDelete Exception", e.getMessage());
		
		} finally {
			log.info("[{}]{}:{}", transactionId, "salesDetailDelete", "End");
		
		}
				
		return "redirect:jo/salesInuqiry";
	}

	
	// 판매서 입력
	@RequestMapping("salesInsertForm")
	public String salesInsertForm(SalesDetail sales, String currentPage, Model model) {
		UUID transactionId = UUID.randomUUID();
		
		try {
			log.info("[{}]{}:{}", transactionId, "salesInsertForm", "Start" );
			
			int custstyle = 1;
			List<SalesDetail> listCustCode = jss.getListCustCode(custstyle);
			
			model.addAttribute("listCustCode", listCustCode);
			model.addAttribute("currentPage", currentPage);
			
		} catch (Exception e) {
			log.error("[{}]{}:{}", transactionId, "salesInsertForm Exception", e.getMessage());
			
		} finally {
			log.info("[{}]{}:{}", transactionId, "salesInsertForm", "End" );
		}
		
		return "jo/salesInsertForm";
	}
	
	
	// 판매서 입력
	@RequestMapping("salesInsert")
	public String salesInsert(SalesDetail sales, String currentPage, Model model) {
		UUID transactionId = UUID.randomUUID();
		int result = 0;
		
		try {
			log.info("[{}]{}:{}", transactionId, "salesInsert", "Start");
			result = jss.InsertSales(sales);
						
		} catch (Exception e) {
			log.info("[{}]{}:{}", transactionId, "salesInsert Exception", e.getMessage());
		} finally {
			log.info("[{}]{}:{}", transactionId, "salesInsert", "End");
		}
		
		if(result > 0) {
			return "redirect:jo/salesInuqiry";
		} else {
			model.addAttribute("msg", "입력실패 확인해보세요");
			return "forward:salesInsertForm";
	    }
		
		
	}

	
	// 판매서 수정
	@RequestMapping("salesUpdateForm")
	public String salesUpdateForm(SalesDetail sales, String currentPage, Model model, HttpServletRequest request) {
		UUID transactionId = UUID.randomUUID();
		System.out.println("JoController salesUpdateForm Start...");
		
		try {
			log.info("[{}]{}:{}", transactionId, "salesUpdateForm", "Start");
			System.out.println("JoController salesUpdateForm Start..." + sales);
			
			SalesDetail salesDetail = jss.getSalesData(sales);
							
			int custstyle = 1;
			List<SalesDetail> listCustCode = jss.getListCustCode(custstyle);
			
			int totalSalesDetail = jss.getTotalSalesDetail(sales); 
			
			Paging page = new Paging(totalSalesDetail, currentPage);
			sales.setStart(page.getStart());
			sales.setEnd(page.getEnd());
			
			List<SalesDetail> salesDetailList = jss.getSalesDetail(sales);
			
			model.addAttribute("salesDetail", salesDetail);
			model.addAttribute("page", page);
			model.addAttribute("listCustCode", listCustCode);
			model.addAttribute("salesDetailList", salesDetailList);
			model.addAttribute("currentPage", currentPage);
		
		} catch (Exception e) {
			log.error("[{}]{}:{}", transactionId, "salesUpdateForm Exception", e.getMessage());
		} finally {
			log.info("[{}]{}:{}", transactionId, "salesUpdateForm", "End");		
		}
		return "jo/salesUpdateForm";
	
	}


}
