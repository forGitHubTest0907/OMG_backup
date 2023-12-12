package com.oracle.OMG.controller.yrController;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.OMG.dto.Item;
import com.oracle.OMG.service.yrService.YrItemService;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Controller
@Data
@Slf4j
@RequestMapping("/item")
public class YrItemController {
	private final YrItemService yis;
	
	@GetMapping("/list")
	public String itemList(Item item, Model model, HttpSession session) {
		System.out.println("YrItemController itemList start");
		List<Item> itemList = yis.itemList();
		model.addAttribute("itemList", itemList);
		return "yr/item/itemList";
	}

	// 아이템 상세보기
	@GetMapping("/detail")
	public String itemDetail(@RequestParam("code") int code, Model model) {
		System.out.println("YrItemController itemDetail start");
		Item itemDetail = yis.selectItem(code);
		model.addAttribute("i", itemDetail);
		return "yr/item/itemDetail";
	}
	
	@RequestMapping("/create")
	public String itemCreate() {
		
		return "yr/item/itemCreate";
	}
}
