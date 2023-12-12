package com.oracle.OMG.dao.jkDao;

import java.util.List;
import java.util.Map;


import com.oracle.OMG.dto.Warehouse;

public interface JkWareDao {

	List<Warehouse> monthData(Map<String, String> params);

	List<Warehouse> getIOData(String monthIOData);

	List<Warehouse> getPurchaseData(String monthIOData);

	List<Warehouse> getSalesData(String monthIOData);
	
}
