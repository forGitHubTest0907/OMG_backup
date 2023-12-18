package com.oracle.OMG.service.joService;

import java.util.List;

import com.oracle.OMG.dto.SalesDetail;

public interface JoSalService {

	List<SalesDetail>      getListSalesInquiry(SalesDetail sales);
	List<SalesDetail>      searchSalesInquiry(SalesDetail sales);
	int                    getTotalSalesInquiry();
	int                    getSearchTotalSalesInquiry();
	int                    getSortTotalSalesInquiry();
	List<SalesDetail>      sortSalesInquiry(int sales_status);

}
