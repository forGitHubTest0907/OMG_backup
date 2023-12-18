package com.oracle.OMG.service.jkService;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;


import com.oracle.OMG.dao.jkDao.JkWareDao;
import com.oracle.OMG.dto.Item;
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

	@Override
	public List<Warehouse> getPurchaseData(Map<String, String> params) {
		System.out.println("JkWareServiceImpl getPurchaseData Start...");
		
		List<Warehouse> getPurchaseData = jwd.getPurchaseData(params);
		
		
		return getPurchaseData;
	}

	@Override
	public List<Warehouse> getSalesData(String monthIOData) {
		System.out.println("JkWareServiceImpl getIOData Start...");
		List<Warehouse> getSalesData = jwd.getSalesData(monthIOData);
		return getSalesData;
	}

	@Override
	public List<Warehouse> getIOData(String monthIOData) {
		System.out.println("JkWareServiceImpl getIOData Start...");
		List<Warehouse> getIOData = jwd.getIOData(monthIOData);
		return getIOData;
	}

	@Override
	public List<Warehouse> getPurchaseDataResultMap(String month, String string) {
		System.out.println("JkWareServiceImpl getPurchaseDataResultMap Start...");
		List<Warehouse> getPurchaseDataResultMap = jwd.getPurchaseDataResultMap(month, string);
		return getPurchaseDataResultMap;
	}

	@Override
	public Map<String, Object> selectItem(int code, String ym) {
		System.out.println("JkWareServiceImpl selectItem Start...");
		
		Map<String, Object> selectItem= jwd.selectItem(code, ym);
		
		return selectItem;
	}

	@Override
	public int insertInv(Warehouse warehouse) {
		System.out.println("JkWareServiceImpl insertInv start");
		int result = jwd.insertInv(warehouse);

		return result;
	}

	@Override
	public Map<String, Object> selectItem2(int code) {
		System.out.println("JkWareServiceImpl selectItem2 Start...");
		
		Map<String, Object> selectItem2= jwd.selectItem2(code);
		
		return selectItem2;
	}


}
