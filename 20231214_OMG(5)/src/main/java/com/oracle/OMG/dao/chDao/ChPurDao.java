package com.oracle.OMG.dao.chDao;

import java.util.List;

import com.oracle.OMG.dto.PurDetail;
import com.oracle.OMG.dto.Purchase;

public interface ChPurDao {

	List<Purchase> 	purList(Purchase purchase);
	List<PurDetail> purDList(Purchase p);
	Purchase 		onePur(Purchase purchase);
	int 			totalPur();
	int 			insertDetail(PurDetail pd);
	int 			countDitem(PurDetail purDetail);

}
