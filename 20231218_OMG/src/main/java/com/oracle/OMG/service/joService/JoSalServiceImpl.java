package com.oracle.OMG.service.joService;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import com.oracle.OMG.dao.joDao.JoSalDao;
import com.oracle.OMG.dto.Sales;
import com.oracle.OMG.dto.SalesDetail;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Data
@Slf4j
public class JoSalServiceImpl implements JoSalService {
	
	private final JoSalDao jsd;
	
	@Override
	public List<SalesDetail> getListSalesInquiry(SalesDetail sales) {
		List<SalesDetail> getListSalesInquiry = jsd.getListSalesInquiry(sales);
		
		if(getListSalesInquiry == null) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Sales 리스트가 존재하지 않습니다.");
		}
		
		return getListSalesInquiry;
		
	}

	
	@Override
	public List<SalesDetail> searchSalesInquiry(SalesDetail sales) {
		List<SalesDetail> searchSalesInquiry = jsd.searchSalesInquiry(sales);
		
		if(searchSalesInquiry == null) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "검색리스트가 존재하지 않습니다");
		}
				
		return searchSalesInquiry;
	}


	@Override
	public int getTotalSalesInquiry() {
		int getTotalSalesInquiry = 0;
		getTotalSalesInquiry = jsd.getTotalSalesInquiry();
		return getTotalSalesInquiry;

	}


	@Override
	public int getSearchTotalSalesInquiry() {
		int getSearchTotalSalesInquiry = 0;
		getSearchTotalSalesInquiry = jsd.getSearchTotalSalesInquiry();
		return getSearchTotalSalesInquiry;
	
	}


	@Override
	public int getSortTotalSalesInquiry() {
		int getSortTotalSalesInquiry = 0;
		getSortTotalSalesInquiry = jsd.getSortTotalSalesInquiry();
		return getSortTotalSalesInquiry;
	}


	@Override
	public List<SalesDetail> sortSalesInquiry(int sales_status) {
		List<SalesDetail> sortSalesInquiry = jsd.sortSalesInquiry(sales_status);
		
		if(sortSalesInquiry == null) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "검색리스트가 존재하지 않습니다");
		}
				
		return sortSalesInquiry;
	}
	

}
