package com.oracle.OMG.dto;

import lombok.Data;

@Data
public class Warehouse {
	private String 	ym;
    private int 	inven;
    private int 	code;    
    private int 	cnt;
    private String 	reg_date;
    
    
    // 조회용
    private String title;
    private int purStatus;
    private int custCode;
    private String purDate;
    private int qty;
    private int price;
    
}
