package com.oracle.OMG.dao.jkDao;

import java.util.List;
import java.util.Map;

import com.oracle.OMG.dto.Item;
import com.oracle.OMG.dto.Warehouse;

public interface JkWareDao {

	List<Warehouse> monthData(Map<String, String> params);

	List<Warehouse> getIOData(String monthIOData);

	List<Warehouse> getPurchaseData(Map<String, String> params);

	List<Warehouse> getSalesData(String monthIOData);

	List<Warehouse> getPurchaseDataResultMap(String month, String string);

	int insertInv(Warehouse warehouse);

	Map<String, Object> 		selectItem(int code, String ym);

	Map<String, Object> 		selectItem2(int code);

	int updateInv(Warehouse warehouse);

	int deleteInv(Warehouse warehouse);

		
}
