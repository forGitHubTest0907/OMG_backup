package com.oracle.OMG.service.chService;

import java.util.List;

import com.oracle.OMG.dto.PurDetail;
import com.oracle.OMG.dto.Purchase;

public interface ChPurService {

	List<Purchase> 	purList(Purchase purchase);
	List<PurDetail> purDList(Purchase p);
	Purchase 		onePur(Purchase purchase);
	int 			totalPur(Purchase purchase);
	int 			insertDetail(PurDetail pd);
	int 			countDitem(PurDetail purDetail);
	int 			writePur(Purchase purchase);
	int 			detailWrite(List<PurDetail> detailList);
	int 			qtyUpdate(PurDetail pd);
	int 			completePur(Purchase purchase);
	int 			deletePur(Purchase purchase);
	int 			purUpdate(Purchase purchase);
	
}
