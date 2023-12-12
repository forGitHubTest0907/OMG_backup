package com.oracle.OMG.dao.chDao;

import java.util.List;

import com.oracle.OMG.dto.PurDetail;
import com.oracle.OMG.dto.Purchase;

public interface ChPurDao {

	List<Purchase> 	purList();
	List<PurDetail> purDList(Purchase p);
	Purchase 		onePur(Purchase purchase);

}
