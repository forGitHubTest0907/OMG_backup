package com.oracle.OMG.service.jkService;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;


import com.oracle.OMG.dao.jkDao.JkWareDao;

import com.oracle.OMG.dto.Warehouse;

import lombok.Data;

@Service
@Data
public class JkWareServiceImpl implements JkWareService {
	
	private final JkWareDao jwd;

	@Override
	public List<Warehouse> monthData(Map<String, String> params) {
		System.out.println("JkWareServiceImpl monthData Start...");
		
		List<Warehouse> monthData = jwd.monthData(params);
		
		return monthData;
	}

}
