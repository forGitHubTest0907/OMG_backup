package com.oracle.OMG.service.chService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.OMG.dao.chDao.ChPurDao;
import com.oracle.OMG.dto.PurDetail;
import com.oracle.OMG.dto.Purchase;

import lombok.Data;

@Service
@Data
public class ChPurServiceImpl implements ChPurService {
	
	private final ChPurDao cpd;

	@Override
	public List<Purchase> purList(Purchase purchase) {
		System.out.println("ChPurServiceImpl purList Start...");
		
		List<Purchase> purList = cpd.purList(purchase);
		
		return purList;
	}

	@Override
	public List<PurDetail> purDList(Purchase p) {
		System.out.println("ChPurServiceImpl purDList Start...");
		
		List<PurDetail> purDList = cpd.purDList(p);
		
		return purDList;
	}

	@Override
	public Purchase onePur(Purchase purchase) {
		System.out.println("ChPurServiceImpl onePur Start...");
		
		Purchase pc = null;
		
		pc = cpd.onePur(purchase);
		
		return pc;
	}

	@Override
	public int totalPur() {
		System.out.println("ChPurServiceImpl totalPur Start...");
		int total = 0;
		
		total = cpd.totalPur();
		
		
		return total;
	}

	@Override
	public int insertDetail(PurDetail pd) {
		System.out.println("ChPurServiceImpl insertDetail Start...");
		int result = 0;
		
		result = cpd.insertDetail(pd);
		
		
		return result;
	}

	@Override
	public int countDitem(PurDetail purDetail) {
		System.out.println("ChPurServiceImpl countDitem Start...");
		int result = 0;
		
		result = cpd.countDitem(purDetail);
		
		
		return result;
	}

}
