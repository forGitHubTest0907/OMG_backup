package com.oracle.OMG.service.yaService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.OMG.dao.yaDao.YaWareHouseDao;
import com.oracle.OMG.dao.yaDao.YaWareHouseDaoImpl;
import com.oracle.OMG.dto.Item;
import com.oracle.OMG.dto.Warehouse;

import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class YaWareHouseServiceImpl implements YaWareHouseService {
	private final YaWareHouseDao ywd;

	@Override
	public List<Warehouse> inventoryList(Warehouse warehouse) {
		System.out.println("YaWareHouseDaoImpl  inventoryList start....");
		List<Warehouse> inventoryList = ywd.inventoryList(warehouse);
		return inventoryList;
	}

	@Override
	public List<Item> itemListSelect(Item item) {
		System.out.println("YaWareHouseDaoImpl  itemListSelect start....");
		List<Item> itemListSelect= ywd.itemListSelect(item);
		return itemListSelect;
	}


}
