package com.oracle.OMG.dto;

import lombok.Data;

@Data
public class SalesDetail {
	private String 	sales_date;
    private int 	custcode;
	private int 	code;
    private int 	qty;
    private int 	price;
}
