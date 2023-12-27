package com.oracle.OMG.service.yaService;

import java.util.List;

import com.oracle.OMG.dto.Item;
import com.oracle.OMG.dto.Warehouse;

public interface YaWareHouseService {
	List<Warehouse> inventoryList(Warehouse warehouse);
	List<Item> 		itemListSelect(Item item);
}
