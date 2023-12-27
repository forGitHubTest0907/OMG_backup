package com.oracle.OMG.dao.yaDao;

import java.util.List;

import com.oracle.OMG.dto.Item;
import com.oracle.OMG.dto.Warehouse;

public interface YaWareHouseDao {
	List<Warehouse> inventoryList(Warehouse warehouse);
	List<Item> 		itemListSelect(Item item);
}
