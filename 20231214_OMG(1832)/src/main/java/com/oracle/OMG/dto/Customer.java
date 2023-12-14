package com.oracle.OMG.dto;

import java.util.Date;

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
    private String mem_name;	//직원이름
    private String mem_dept;	//직원부서
    
    //거래처 실적 join
    private String purDate;		//매출입일자
    private int purCode;		//매출입제품코드
    private int purQty; 		//매출입수량
    private int purPrice; 		//매출입 단가
    private String itemName; 	//매출입제품이름
    private Date date;			//매출입일자 date타입... 맞는건지 확인 필요..

    
    
	// 페이징 조회용    //검색타입		//검색 내용
	private String search;   	private String keyword;
	private String pageNum;
	private int start; 		 	private int end;
}
