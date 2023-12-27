package com.oracle.OMG.dao.yaDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.OMG.dto.Customer;
import com.oracle.OMG.dto.Item;
import com.oracle.OMG.dto.Warehouse;

import lombok.RequiredArgsConstructor;
@Repository
@RequiredArgsConstructor
public class YaWareHouseDaoImpl implements YaWareHouseDao {	
	
	private final SqlSession session;

	@Override
	public List<Warehouse> inventoryList(Warehouse warehouse) {
		System.out.println("YaInventoryDaoImpl inventroyList start...");
		List<Warehouse> inventoryList = null;
		try {
			inventoryList = session.selectList("inventoryList", warehouse);
		} catch (Exception e) {
			System.out.println("YaInventoryDao inventroyList e.getMessage? " + e.getMessage());
		}
		
		return inventoryList;
	}

	public List<Item> itemListSelect(Item item) {
		System.out.println("YaInventoryDaoImpl  itemListSelect start...");
		List<Item> itemListSelect = null;
		try {
			itemListSelect = session.selectList("itemListSelectOne", item);
		} catch (Exception e) {
			System.out.println("YaInventoryDao itemListSelect e.getMessage? " + e.getMessage());
		}
		return itemListSelect;
	}
}
