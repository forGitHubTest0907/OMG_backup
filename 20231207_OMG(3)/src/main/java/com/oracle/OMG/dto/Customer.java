package com.oracle.OMG.dto;

import lombok.Data;

@Data
public class Customer {
	private int 	custcode;
    private int 	mem_id;
    private int 	cust_lg;
    private int 	cust_md;
    private String 	custstyle;
    private String 	company;
    private String 	ceo;
    private String 	businum;
    private String 	busitype;
    private String 	busiitems;
    private String 	tel;
    private String 	email;
}
