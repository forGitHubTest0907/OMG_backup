package com.oracle.OMG.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Warehouse {
	private String 	ym;
    private int 	inven;
    private int 	code;    
    private int 	cnt;
    private Date 	reg_date;
    
    
    // 조회용
    private String title;
    private int purStatus;
    private int custCode;
    private String purDate;
    private int qty;
    private int price;
    private String name;
    private String mem_name;
    
}
