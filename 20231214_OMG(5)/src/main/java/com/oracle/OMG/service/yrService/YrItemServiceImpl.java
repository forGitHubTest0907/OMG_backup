package com.oracle.OMG.service.yrService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.OMG.dao.yrDao.YrItemDao;
import com.oracle.OMG.dto.Item;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class YrItemServiceImpl implements YrItemService {

	private final YrItemDao yid;
	
	@Override
	public List<Item> itemList() {
		System.out.println("YrItemServiceImpl itemList start");
		List<Item> itemList = yid.itemList();
		return itemList;
	}

	@Override
	public Item selectItem(int code) {
		System.out.println("YrItemServiceImpl itemDetail start");
		Item itemDetail = yid.selectItem(code);
		return itemDetail;
	}

}
