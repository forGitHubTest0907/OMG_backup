package com.oracle.OMG.service.yrService;

import java.util.List;

import com.oracle.OMG.dto.Item;

public interface YrItemService {

	List<Item> 	itemList();
	Item 		selectItem(int code);
	int 		insertItem(Item item);
	int 		updateItem(Item item);

}
