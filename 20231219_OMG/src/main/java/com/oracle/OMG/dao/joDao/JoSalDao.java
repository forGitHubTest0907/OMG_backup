package com.oracle.OMG.dao.joDao;

import java.util.List;

import com.oracle.OMG.dto.SalesDetail;

public interface JoSalDao {

	List<SalesDetail>       getListSalesInquiry(SalesDetail sales);
	List<SalesDetail>		searchSalesInquiry(SalesDetail sales);
	int                     getTotalSalesInquiry();
	int                     getSearchTotalSalesInquiry();
	int                     getSortTotalSalesInquiry();
	List<SalesDetail>       sortSalesInquiry(int sales_status);

}
