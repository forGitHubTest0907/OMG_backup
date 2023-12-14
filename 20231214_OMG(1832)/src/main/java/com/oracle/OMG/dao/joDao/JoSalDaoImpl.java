package com.oracle.OMG.dao.joDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;

import com.oracle.OMG.dto.SalesDetail;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class JoSalDaoImpl implements JoSalDao {
	
	private final SqlSession session;
	private final PlatformTransactionManager transactionManager; 
		
	@Override
	public List<SalesDetail> getListSalesInquiry(SalesDetail sales) {
		
		List<SalesDetail> getListSalesInquiry = null;
		
		try {
			log.info("JoSalDaoImpl getListSalesInquiry Start");
			getListSalesInquiry = session.selectList("joListSalesInquiry", sales);
			log.info("JoSalDaoImpl getListSalesInquiry.size() -> " + getListSalesInquiry.size());
			
		} catch (Exception e) {
			log.error("JoSalDaoImpl getListSalesInquiry e.getMessage() -> " + e.getMessage());
		}
		
		return getListSalesInquiry;
		
	}

	
	@Override
	public List<SalesDetail> searchSalesInquiry(SalesDetail sales) {
		List<SalesDetail> searchSalesInquiry = null;
		
		try {
			log.info("JosalDaoImpl searchSalesInquiry Start");
			searchSalesInquiry = session.selectList("joSearchSalesInquiry", sales);
			log.info("JosalDaoImpl searchSalesInquiry.size() -> " + searchSalesInquiry.size());
			
		} catch (Exception e) {
			log.info("JosalDaoImpl searchSalesInquiry Exception -> " + e.getMessage());
		}
		
		return searchSalesInquiry;
	}


	@Override
	public int getTotalSalesInquiry() {
		int getTotalSalesInquiry = 0;
		
		try {
			log.info("JosalDaoImpl getTotalSalesInquiry Start");
			getTotalSalesInquiry = session.selectOne("joGetTotalSalesInquiry");
			log.info("JosalDaoImpl getTotalSalesInquiry -> " + getTotalSalesInquiry);
			
		} catch (Exception e) {
			log.info("JosalDaoImpl getTotalSalesInquiry Exception -> " + e.getMessage());
		
		}
		return getTotalSalesInquiry;
	
	}


	@Override
	public int getSearchTotalSalesInquiry() {
		int getSearchTotalSalesInquiry = 0;
		
		try {
			log.info("JosalDaoImpl getSearchTotalSalesInquiry Start");
			getSearchTotalSalesInquiry = session.selectOne("joGetSearchTotalSalesInquiry");
			log.info("JosalDaoImpl getSearchTotalSalesInquiry -> " + getSearchTotalSalesInquiry);
			
		} catch (Exception e) {
			log.info("JosalDaoImpl getSearchTotalSalesInquiry Exception -> " + e.getMessage());
		
		}
		return getSearchTotalSalesInquiry;
	
	}


	@Override
	public int getSortTotalSalesInquiry() {
		int getSortTotalSalesInquiry = 0;
		
		try {
			log.info("JosalDaoImpl getSortTotalSalesInquiry Start");
			getSortTotalSalesInquiry = session.selectOne("joGetSortTotalSalesInquiry");
			log.info("JosalDaoImpl getSortTotalSalesInquiry -> " + getSortTotalSalesInquiry);
			
		} catch (Exception e) {
			log.info("JosalDaoImpl getSearchTotalSalesInquiry Exception -> " + e.getMessage());
		
		}
		return getSortTotalSalesInquiry;
	
	}


	@Override
	public List<SalesDetail> sortSalesInquiry(int sales_status) {
		List<SalesDetail> sortSalesInquiry = null;
		
		try {
			log.info("JosalDaoImpl sortSalesInquiry Start");
			sortSalesInquiry = session.selectList("joSortSalesInquiry", sales_status);
			log.info("JosalDaoImpl sortSalesInquiry.size() -> " + sortSalesInquiry.size());
			
		} catch (Exception e) {
			log.info("JosalDaoImpl sortSalesInquiry Exception -> " + e.getMessage());
		}
		
		return sortSalesInquiry;
	
	}
		
		
}

	
