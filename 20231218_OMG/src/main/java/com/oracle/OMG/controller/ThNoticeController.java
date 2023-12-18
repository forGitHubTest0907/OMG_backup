package com.oracle.OMG.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oracle.OMG.dto.Board;
import com.oracle.OMG.dto.Criteria;
import com.oracle.OMG.dto.PageDTO;
import com.oracle.OMG.service.thService.ThNoticeService;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Data
@RequestMapping("/notice/*")
public class ThNoticeController {
	
	private final ThNoticeService ns;
	
//	@GetMapping("/list")
//	public void list(Board board, Model model, String currentPage, HttpSession session ) {
//		log.info("list");
//		
//		// 공지사항 게시글 수
//		int totNotice = 0;
//		totNotice = ns.getNoticeTot();
//		
//		// Pagination
//		Paging page = new Paging(totNotice, currentPage, 10);
//		log.info("page --> " + page);
//		board.setStart(page.getStart());
//		board.setEnd(page.getEnd());
//		
//		// 공지사항 게시글 10개 가져와서 model 에저장
//		model.addAttribute("noticeList", ns.getNoticeList(board));
//		
//	}
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		int total = ns.getNoticeTot();
		log.info("list: " + cri);
		model.addAttribute("noticeList", ns.getNoticeList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		
	}
	
	@GetMapping("/register")
	public void register() {	
		
	}
	
	@PostMapping("/register")
	public String register(Board board, RedirectAttributes rttr) {
		
		// 입력받은 값 확인
		log.info("register: " + board);
		
		// 게시글 등록
		ns.registerNotice(board);
		
		// 새로 등록된 게시물 번호 전달하기 위해 사용
		rttr.addFlashAttribute("result", board.getBrd_id());
		log.info("board.getBrd_id(): " + board.getBrd_id());
		
		return "redirect:/notice/list";
	}

	// RequestParam 생략 가능하다는데 한번해보기  --> @RequestParam("brd_id") 생략 가능 / 명시적 느낌에서 선언한 듯?
	@GetMapping({"/get", "/modify"})
	public void get(int brd_id, Model model) {
		
		log.info("/get or modify");
		model.addAttribute("notice", ns.getNotice(brd_id));
	}

	
	@PostMapping("/modify")
	public String modify(Board board, RedirectAttributes rttr) {
		
		log.info("modify"+ board);
		
		if(ns.modifyNotice(board) > 0) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/notice/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("brd_id") int brd_id, RedirectAttributes rttr) {
		
		log.info("remove ..." + brd_id);
		
		if(ns.removeNotice(brd_id) > 0) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/notice/list";
	}
}
