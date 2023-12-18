package com.oracle.OMG.dao.yrDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.OMG.dto.Comm;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class YrCommDaoImpl implements YrCommDao {
	private final SqlSession session;
	
	@Override
	public List<Comm> commList() {
		System.out.println("YrCommDaoImpl commList start");
		List<Comm> comm = null;
		try {
			comm = session.selectList("yrCommItemSelectList");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return comm;
	}

}
