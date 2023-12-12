package com.oracle.OMG.service.chService;

import java.util.List;

import com.oracle.OMG.dto.PurDetail;
import com.oracle.OMG.dto.Purchase;

public interface ChPurService {

	List<Purchase> 	purList();
	List<PurDetail> purDList(Purchase p);
	Purchase 		onePur(Purchase purchase);
	
}
