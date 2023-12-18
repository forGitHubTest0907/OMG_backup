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
	public List<Item> itemList(Item item) {
		System.out.println("YrItemDaoImpl itemList start");
		List<Item> itemList = null;
		try {
			itemList = session.selectList("yrItemList", item);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return itemList;
	}

	@Override
	public Item selectItem(int code) {
		System.out.println("YrItemDaoImpl selectItem start");
		Item itemDetail = null;
		try {
			itemDetail = session.selectOne("yrSelectItem", code);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return itemDetail;
	}

	@Override
	public int insertItem(Item item) {
		System.out.println("YrItemDaoImpl insertItem start");
		int result = 0;
		try {
			result = session.insert("yrInsertItem", item);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	@Override
	public int updateItem(Item item) {
		System.out.println("YrItemDaoImpl updateItem start");
		int result = 0;
		try {
			result = session.update("yrUpdateItem", item);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	// 삭제 기능은 일단 보류	
//	@Override
//	public int deleteItem(int code) {
//		System.out.println("YrItemDaoImpl deleteItem start");
//		int result = 0;
//		try {
//			result = session.delete("yrDeleteItem", code);
//		} catch (Exception e) {
//			System.out.println(e.getMessage());
//		}
//		return result;
//	}

}
