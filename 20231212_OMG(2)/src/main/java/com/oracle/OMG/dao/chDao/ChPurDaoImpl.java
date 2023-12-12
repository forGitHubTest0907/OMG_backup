package com.oracle.OMG.dao.chDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.OMG.dto.PurDetail;
import com.oracle.OMG.dto.Purchase;

import lombok.Data;

@Repository
@Data
public class ChPurDaoImpl implements ChPurDao {
	
	private final SqlSession session;
	// 발주서 리스트 조회
	@Override
	public List<Purchase> purList() {
		System.out.println("ChPurDaoImpl purList start...");
		List<Purchase> purList = null;
		
		try {
			purList = session.selectList("chPurList");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ChPurDaoImpl purList e.getMessage()" + e.getMessage());
		}
		System.out.println("ChPurDaoImpl purList.size()->" + purList.size());
		return purList;
	}
	// 발주 상세 
	@Override
	public List<PurDetail> purDList(Purchase p) {
		System.out.println("ChPurDaoImpl purList start...");
		List<PurDetail> purDList = null;
		
		try {
			purDList = session.selectList("chPurDList", p);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ChPurDaoImpl purList e.getMessage()" + e.getMessage());
		}
		
		return purDList;
	}

	@Override
	public Purchase onePur(Purchase purchase) {
		System.out.println("ChPurDaoImpl onePur start...");
		
		Purchase pc = null;
		try {
			pc = session.selectOne("chPurOne", purchase);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ChPurDaoImpl purchase e.getMessage()" + e.getMessage());
		}
		return pc;
	}

	
}
