package com.oracle.OMG.service.joService;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import com.oracle.OMG.dao.joDao.JoSalDao;
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
	

}
