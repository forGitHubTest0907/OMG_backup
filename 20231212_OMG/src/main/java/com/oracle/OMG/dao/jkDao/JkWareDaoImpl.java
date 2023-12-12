package com.oracle.OMG.dao.jkDao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.oracle.OMG.dto.Warehouse;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Repository
@Data
@RequiredArgsConstructor
public class JkWareDaoImpl implements JkWareDao {

	private final SqlSession session;
	
	
	@Override
	public List<Warehouse> monthData(Map<String, String> params) {
		System.out.println("JkWareDaoImpl monthData start...");
		List<Warehouse> monthData = null;
		
		try {
			monthData = session.selectList("monthDataList", params);
			System.out.println("monthDatalistsize"+monthData);
			 System.out.println("Params: " + params);
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("JkWareDaoImpl monthDataList error?"+ e.getMessage());
		}
		
		return monthData;
	}


	
	
}
