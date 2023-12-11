package com.oracle.OMG.dto;

import lombok.Data;

@Data
public class Purchase {
	private String 	pur_date;
	private int 	custcode;
    private int 	pur_status;
    private String 	title;
    private int		mem_id;
    private String	ref;
}
