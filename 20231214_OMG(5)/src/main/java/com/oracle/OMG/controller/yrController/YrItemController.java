package com.oracle.OMG.controller.yrController;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.OMG.dto.Comm;
import com.oracle.OMG.dto.Customer;
import com.oracle.OMG.dto.Item;
import com.oracle.OMG.service.yrService.YrCommService;
import com.oracle.OMG.service.yrService.YrCustomerService;
import com.oracle.OMG.service.yrService.YrItemService;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Controller
@Data
@Slf4j
@RequestMapping("/item")
public class YrItemController {
	private final YrItemService 	yis;
	private final YrCommService 	ycms;
	private final YrCustomerService ycss;
	
	@GetMapping("/list")
	public String itemList(Item item, Model model, HttpSession session) {
		System.out.println("YrItemController itemList start");
		
		// 제품 전체 리스트 가져오기
		List<Item> itemList = yis.itemList();
		
		model.addAttribute("itemList", itemList);
		
		return "yr/item/itemList";
	}

	// 아이템 상세보기
	@GetMapping("/detail")
	public String itemDetail(@RequestParam("code") int code, Model model) {
		System.out.println("YrItemController itemDetail start");
		
		// 제품 상세정보
		Item itemDetail = yis.selectItem(code);
		
		// 거래처 전체 리스트
		List<Customer> customer = ycss.customerList();
		
		// 카테고리 전체 리스트
		List<Comm> comm = ycms.commList();
		
		model.addAttribute("i", itemDetail);
		model.addAttribute("cs", customer);
		model.addAttribute("cm", comm);
		
		return "yr/item/itemDetail";
	}
	
	@PostMapping("/update")
	public String itemUpdate(Item item, Model model) {
		System.out.println("YrItemController itemUpdate start");
		
		
		return null;
	}
	
	@GetMapping("/create")
	public String itemCreate(Model model) {
		// 거래처 전체 리스트
		List<Customer> customer = ycss.customerList();
		
		// 카테고리 전체 리스트
		List<Comm> comm = ycms.commList();
		
		model.addAttribute("cs", customer);
		model.addAttribute("cm", comm);
		
		return "yr/item/itemCreate";
	}
	
	@PostMapping("/createPro")
	public String itemCreatePro() {
		
		return "yr/item/itemCreate";
	}
}
