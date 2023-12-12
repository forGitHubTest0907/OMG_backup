package com.oracle.OMG.dao.shDao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.OMG.dto.Item;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class memberDaoImpl implements memberDao {
	
	private final SqlSession session;
	
	@Override
	public Item item() {
		// TODO Auto-generated method stub
		return null;
	}

}
