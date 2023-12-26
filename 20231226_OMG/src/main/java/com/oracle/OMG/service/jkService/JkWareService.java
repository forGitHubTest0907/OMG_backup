package com.oracle.OMG.service.jkService;

import java.util.List;
import java.util.Map;

import com.oracle.OMG.dto.Item;
import com.oracle.OMG.dto.Purchase;
import com.oracle.OMG.dto.Warehouse;

public interface JkWareService {

	List<Warehouse> monthData(Map<String, String> params);
	List<Warehouse> getPurchaseData(Map<String, String> params);
	List<Warehouse> getSalesData(String monthIOData);
	List<Warehouse> getIOData(String monthIOData);
	List<Warehouse> getPurchaseDataResultMap(String month, String string);
	
	// 제품조회
	Map<String, Object> 		selectItem(int code, String ym);
	Map<String, Object> 		selectItem2(int code);

	// 기초재고 관리
	int 						insertInv(Warehouse warehouse);
	int 						updateInv(Warehouse warehouse);
	int 						deleteInv(Warehouse warehouse);
	
	// 발주 조회
	List<Purchase>				purMonthData(String month);

	

	
	
}
