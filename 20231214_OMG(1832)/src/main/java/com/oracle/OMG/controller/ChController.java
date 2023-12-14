package com.oracle.OMG.controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oracle.OMG.dto.Comm;
import com.oracle.OMG.dto.Customer;
import com.oracle.OMG.dto.Item;
import com.oracle.OMG.dto.PurDetail;
import com.oracle.OMG.dto.Purchase;
import com.oracle.OMG.service.chService.ChCustService;
import com.oracle.OMG.service.chService.ChItemService;
import com.oracle.OMG.service.chService.ChPurService;
import com.oracle.OMG.service.chService.Paging;
import com.oracle.OMG.service.yrService.YrItemService;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Controller
@Data
@Slf4j
public class ChController {
	
	private final ChPurService 	chPurService;
	private final ChItemService chItemService;
	private final ChCustService	chCustService;
	private final YrItemService itemService;
	
	
	@RequestMapping("purList")
	public String purList(Model model, String currentPage, Purchase purchase) {
		int totalPur = 0;
		List<Purchase> purList = null;
		Paging page = null;
		System.out.println("ChController purList Start...");
		
		totalPur = chPurService.totalPur();
		
		
		page = new Paging(totalPur, currentPage);
		
		purchase.setStart(page.getStart());
		purchase.setEnd(page.getEnd());
		
		//발주서 전체 리스트
		purList = chPurService.purList(purchase);
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
		model.addAttribute("totalPur",totalPur);
		
		return "ch/purList";
	}
	// 발주신청 페이지로 이동
	@RequestMapping("purWriteForm")
	public String purWriteForm(Model model, HttpSession session) {
		List<Customer> pur_custList = null; // 매입처 List 
		
		System.out.println("ChController purWriteForm Start...");
		//회원 정보 조회 넣기, 로그인 여부 확인하기 
		int mem_id = 1001;
		
		pur_custList = chCustService.custList();
		
		model.addAttribute("pur_custList", pur_custList);
		model.addAttribute("mem_id", mem_id);
		
		
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
		// 해당 회사의 item List
		List<Item> itemList = chItemService.cItemList(purchase.getCustcode());
		// 람다 이용 총 합계 구하기 
		int totalPrice = pdList.stream().mapToInt(m->m.getPrice() * m.getQty()).sum();
		int totalQty   = pdList.stream().mapToInt(m->m.getQty()).sum();
		
		
		
		
		model.addAttribute("pc",pc);
		model.addAttribute("pdList",pdList);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("totalQty", totalQty);
		model.addAttribute("itemList", itemList);
		
		return "ch/purDtailPage";
	}
	
	
	@PostMapping("writePurchase")
	public String writePurchase(Purchase purchase, Map<String, Object> detailMap) {
		System.out.println("ChController writePurchase Start...");
		
		System.out.println("custcode->"+purchase.getCustcode());
		
		return "redirect:purList";
	}
	
	@ResponseBody
	@PostMapping("insertDetail")
	public ModelAndView insertDetail(PurDetail pd,ModelAndView mav) {
		int result = 0;
		System.out.println("ChController insertDetail Start...");
		// custcode와 price를 가져오기 위한 조회
		Item item = itemService.selectItem(pd.getCode());
		pd.setCustcode(item.getCustcode());
		pd.setPrice(item.getInput_price());
		System.out.println("pd.getPur_date" + pd.getPur_date());
		result = chPurService.insertDetail(pd);
		if(result > 0) {
			// PK를 이용한 단일 발주서 확인
			Purchase pc = new Purchase();
			pc.setCustcode(pd.getCustcode());
			pc.setPur_date(pd.getPur_date());
			// 해당 발주서의 상세 항목 출력 
			List<PurDetail> pdList = chPurService.purDList(pc);
			// 람다 이용 총 합계 구하기 
			int totalPrice = pdList.stream().mapToInt(m->m.getPrice() * m.getQty()).sum();
			int totalQty   = pdList.stream().mapToInt(m->m.getQty()).sum();
			mav.addObject("pdList",pdList);
			mav.addObject("totalPrice", totalPrice);
			mav.addObject("totalQty", totalQty);
			
			mav.setViewName("ch/purDtable");
		}
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("chkDItem")
	public int chkDItem(PurDetail purDetail) {
		int result = 0;
		System.out.println("ChController chkDItem Start..............");
		result = chPurService.countDitem(purDetail);
		
		return result; 
	}
	
	@ResponseBody
	@RequestMapping("getItems")
	public ModelAndView getItems(int custcode, ModelAndView mav) {
		List<Item> itemList= null;
		System.out.println("ChController getItems Start..............");
		itemList = chItemService.cItemList(custcode);
		
		mav.addObject("itemList",itemList);
		
		mav.setViewName("ch/pur_selectItems");
		
		return mav; 
	}
	
	@ResponseBody
	@RequestMapping("wirteDetail")
	public ModelAndView itemDetail(PurDetail purDetail,String rownum ,ModelAndView mav) {
		System.out.println("itemDetail Start...");
		Item item = itemService.selectItem(purDetail.getCode());
		
		mav.addObject("item",item);
		mav.addObject("qty",purDetail.getQty());
		mav.addObject("rownum",rownum);
		mav.setViewName("ch/wirteBodyRow");
		
		return mav;
	}
}
