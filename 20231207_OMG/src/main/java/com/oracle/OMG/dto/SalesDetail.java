package com.oracle.OMG.dto;

import lombok.Data;

@Data
public class SalesDetail {
	private String 	sales_date;
    private int 	code;
    private int 	custcode;
    private int 	qty;
    private int 	price;
}
