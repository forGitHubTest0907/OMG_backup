package com.oracle.OMG.service.jkService;

import java.util.List;
import java.util.Map;

import com.oracle.OMG.dto.Purchase;
import com.oracle.OMG.dto.Warehouse;

public interface JkWareService {

	List<Warehouse> monthData(Map<String, String> params);
	
}
