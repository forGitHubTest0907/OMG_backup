package com.oracle.OMG.dao.yrDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.OMG.dto.Item;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class YrItemDaoImpl implements YrItemDao {

	private final SqlSession session;
	
	@Override
	public List<Item> itemList() {
		System.out.println("YrItemDaoImpl itemList start");
		List<Item> itemList = null;
		try {
			itemList = session.selectList("itemList");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return itemList;
	}

	@Override
	public Item selectItem(int code) {
		System.out.println("YrItemDaoImpl itemList start");
		Item itemDetail = null;
		try {
			itemDetail = session.selectOne("selectItem", code);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return itemDetail;
	}

}
