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
    
    
    //참조용
    private String mem_name;
    private String mem_dept;
    
    
	// 페이징 조회용    //검색타입		//검색 내용
	private String search;   	private String keyword;
	private String pageNum;
	private int start; 		 	private int end;
}
