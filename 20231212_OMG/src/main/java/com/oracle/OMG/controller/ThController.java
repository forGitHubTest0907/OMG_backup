package com.oracle.OMG.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.OMG.dto.Board;
import com.oracle.OMG.service.thService.Paging;
import com.oracle.OMG.service.thService.ThQnAService;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Controller
@Data
@Slf4j
public class ThController {
	
	private final ThQnAService qs;
	
	@GetMapping("/notice")
	public String noticeList(Board board, String currentPage, Model model, HttpSession session){
		System.out.println("ThController noticeList Start...");
		
		return "th/noticeList";
	}
	
	@GetMapping("/notice/write")
	public String noticeWriteForm(){
		System.out.println("ThController noticeWriteForm Start...");
		return "th/noticeWriteForm";
	}
	
	// URI 변경 예정
	@GetMapping("/notice/detail")
	public String noticeDetail(){
		System.out.println("ThController noticeDetail Start...");
		return "th/noticeDetail";
	}

	// URI 변경 예정
	@GetMapping("/notice/update")
	public String noticeUpdateForm(){
		System.out.println("ThController noticeUpdateForm Start...");
		return "th/noticeUpdateForm";
	}
	
	@GetMapping("/qna")
	public String QnAList(Board board, String currentPage, Model model, HttpSession session){
		System.out.println("ThController QnAList Start...");
		// QnA 게시글 수
		int totalQnA = 0;
		totalQnA = qs.totalQnA();
		
		// Pagination								페이지당 가져올 게시글수
		Paging page = new Paging(totalQnA, currentPage, 10);
		System.out.println("page --> " + page);
		
		// board DTO에 담음(조회용변수 start, end 존재)
		board.setStart(page.getStart());
		board.setEnd(page.getEnd());
		
		// QnA 게시글 10개씩 가져오기
		List<Board> QnAList = qs.selectQnAList(board);
		
		// model에 저장
		model.addAttribute("QnAList", QnAList);
		return "th/QnAList";
	}	
	
	@GetMapping("/qna/write")
	public String QnAWriteForm(){
		System.out.println("ThController QnAWriteForm Start...");
		return "th/QnAWriteForm";
	}
	
	// URI 변경 예정
	@GetMapping("/qna/detail")
	public String QnADetail(){
		System.out.println("ThController QnADetail Start...");
		return "th/QnADetail";
	}
	
	// URI 변경 예정
	@GetMapping("/qna/update")
	public String QnAUpdateForm(){
		System.out.println("ThController QnAUpdateForm Start...");
		return "th/QnAUpdateForm";
	}
	
	
}
