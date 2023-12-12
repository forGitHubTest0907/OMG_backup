package com.oracle.OMG.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.OMG.dto.Comm;
import com.oracle.OMG.dto.PurDetail;
import com.oracle.OMG.dto.Purchase;
import com.oracle.OMG.service.chService.ChPurService;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Controller
@Data
@Slf4j
public class ChController {
	private final ChPurService chPurService;
	
	
	@RequestMapping("purList")
	public String purList(Model model) {
		
		System.out.println("ChController purList Start...");
		List<Purchase> purList = null;
		//발주서 전체 리스트
		purList = chPurService.purList();
		// 발주서 리스트 소환 성공시 
		if(purList != null) {
			// purList 조회 성공 시
			for(Purchase p: purList) {
				// 제품 종류			총수량		총가격(전체 가격)
				int totalType = 0; int totalPrice = 0;
				
				// 발주서 상세 내용 불러오기 
				List<PurDetail> pd = chPurService.purDList(p);
				totalType = pd.size(); // row 수 = 발주서 내 물품 수
				System.out.println();
				// 상세 내용의 물품 항목별 수량과 결제액 
				for(PurDetail pd2 : pd) {
					totalPrice += pd2.getQty() * pd2.getPrice();
				}
				p.setTotalType(totalType);
				p.setTotalQty(pd.stream().mapToInt(m->m.getQty()).sum());
				p.setTotalPrice(totalPrice);
			}
		}
		
		model.addAttribute("purList",purList);
		
		return "ch/purList";
	}
	// 발주신청 페이지로 이동
	@RequestMapping("/purWriteForm")
	public String purWriteForm(Model model) {
		System.out.println("ChController purWriteForm Start...");
		//회원 정보 조회 넣기, 로그인 여부 확인하기 
		int mem_id = 1001;
		
		return "ch/purWriteForm";
	}
	
	@GetMapping("purDtail")
	public String purDtail(Model model,Purchase purchase) {
		//회원 정보 조회 넣기, 로그인 여부 확인하기 담당자 or 신청자가 아니라면 수정 불가 
		int mem_id = 1001;
		
		System.out.println("purchase.getPur_date()->" + purchase.getPur_date());
		System.out.println("purchase.getCustcode()->" + purchase.getCustcode());
		
		// PK를 이용한 단일 발주서 확인
		Purchase pc = chPurService.onePur(purchase);
		// 해당 발주서의 상세 항목 출력 
		List<PurDetail> pdList = chPurService.purDList(pc);
		// 람다 이용 총 합계 구하기 
//		int totalPrice = pdList.stream().map(m->m.getPrice() * m.getQty()).collect(Collectors.summarizingInt(m))
		int totalPrice = pdList.stream().mapToInt(m->m.getPrice() * m.getQty()).sum();
		int totalQty   = pdList.stream().mapToInt(m->m.getQty()).sum();
		
		
		
		
		model.addAttribute("pc",pc);
		model.addAttribute("pdList",pdList);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("totalQty", totalQty);
		
		return "ch/purDtailPage";
	}
	
}
