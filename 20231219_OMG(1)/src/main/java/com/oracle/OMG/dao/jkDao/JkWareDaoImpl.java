package com.oracle.OMG.dao.jkDao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.OMG.dto.Item;
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


	@Override
	public List<Warehouse> getIOData(String monthIOData) {
		System.out.println("JkWareDaoImpl getIOData start...");
		List<Warehouse> getIOData = null;
		
		try {
			getIOData = session.selectList("getIOData", monthIOData);
			System.out.println("monthDatalistsize"+getIOData);
			 System.out.println("monthIOData: " + monthIOData);
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("JkWareDaoImpl getIOData error?"+ e.getMessage());
		}
		
		return getIOData;
	}


	@Override
	public List<Warehouse> getPurchaseData(Map<String, String> params) {
	    System.out.println("JkWareDaoImpl getPurchaseData start...");
	    
	    List<Warehouse> getPurchaseData = null;
	    
	    try {
	        getPurchaseData = session.selectList("getPurchaseData", params);
	        System.out.println("monthDatalistsize: " + getPurchaseData.size());
	        System.out.println("params: " + params);
	    } catch(Exception e) {
	        e.printStackTrace();
	        System.out.println("JkWareDaoImpl getPurchaseData error: " + e.getMessage());
	    }
	    return getPurchaseData;
	}


	@Override
	public List<Warehouse> getSalesData(String monthIOData) {
		System.out.println("JkWareDaoImpl getSalesData start...");
		List<Warehouse> getSalesData = null;
		
		try {
			getSalesData = session.selectList("getSalesData", monthIOData);
			System.out.println("monthDatalistsize"+getSalesData);
			 System.out.println("monthIOData: " + monthIOData);
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("JkWareDaoImpl getSalesData error?"+ e.getMessage());
		}
		return getSalesData;
	}


	@Override
	public List<Warehouse> getPurchaseDataResultMap(String month, String string) {
		System.out.println("JkWareDaoImpl getPurchaseDataResultMap start...");
		List<Warehouse> getPurchaseDataResultMap = null;
		
		try {
			getPurchaseDataResultMap = session.selectList("resultmap01", getPurchaseDataResultMap);
			System.out.println("getPurchaseDataResultMaptsize"+getPurchaseDataResultMap);
			 System.out.println("getPurchaseDataResultMap: " + getPurchaseDataResultMap);
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("JkWareDaoImpl getSalesData error?"+ e.getMessage());
		}
		return getPurchaseDataResultMap;
	}


	@Override
	public Map<String, Object> selectItem(@Param("code") int code, @Param("ym") String ym) {
	    System.out.println("JkWareDaoImpl selectItemByCode start");
	    Map<String, Object> itemDetails = null;
	    try {
	        // 매퍼 메서드에 파라미터를 전달하도록 수정
	        Map<String, Object> parameters = new HashMap<>();
	        parameters.put("code", code);
	        parameters.put("ym", ym);
	        
	        itemDetails = session.selectOne("selectItem", parameters);
	    } catch (Exception e) {
	        System.out.println(e.getMessage());
	    }
	    return itemDetails;
	}


	@Override
	public int insertInv(Warehouse warehouse) {
		System.out.println("JkWareDaoImpl insertInv start");
		int result = 0;
	
		try {
			result = session.insert("insertInv", warehouse);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		
		}
		return result;
	}


	@Override
	public Map<String, Object> selectItem2(int code) {
		 System.out.println("JkWareDaoImpl selectItemByCode start");
		    Map<String, Object> itemDetails = null;
		    try {
		      
		        Map<String, Object> parameters = new HashMap<>();
		        parameters.put("code", code);
		       		        
		        itemDetails = session.selectOne("selectItem2", parameters);
		    } catch (Exception e) {
		        System.out.println(e.getMessage());
		    }
		    return itemDetails;
	}


	@Override
	public int updateInv(Warehouse warehouse) {
		System.out.println("JkWareDaoImpl updateInv start");
		int result = 0;
	
		try {
			result = session.update("updateInv", warehouse);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		
		}
		return result;
	}


	@Override
	public int deleteInv(Warehouse warehouse) {
		System.out.println("JkWareDaoImpl deleteInv start");
		int result = 0;
	
		try {
			result = session.delete("deleteInv", warehouse);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		
		}
		return result;
	}





	
	
}
