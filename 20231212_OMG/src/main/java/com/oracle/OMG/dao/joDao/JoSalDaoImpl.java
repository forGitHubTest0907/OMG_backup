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

	
	
}
