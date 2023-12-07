package com.oracle.OMG.dto;

import lombok.Data;

@Data
public class Purchase {
	private int custcode;
    private String pur_date;
    private int pur_status;
}
