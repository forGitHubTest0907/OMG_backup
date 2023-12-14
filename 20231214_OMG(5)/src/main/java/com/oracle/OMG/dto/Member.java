package com.oracle.OMG.dto;

import lombok.Data;

@Data
public class Member {
	private int 	mem_id;
    private String 	mem_img;
    private String 	mem_name;
    private String 	mem_pw;
    private String 	mem_bd;
    private String 	mem_sex;
    private String 	mem_email;
    private int 	mem_mailcode;
    private String 	mem_address;
    private String 	mem_hiredate; // Date를 String으로 변경
    private String 	mem_dept;
    private String 	mem_position1;
    private String 	mem_position2;
    private int 	mem_position3;
    private String 	mem_phone;
    private String 	mem_leave; // Date를 String으로 변경
    private String 	mem_rein; // Date를 String으로 변경
    private String 	mem_resi; // Date를 String으로 변경
    private int 	mem_right;
    private int 	mem_status;
    private String 	reg_date; // Date를 String으로 변경

}
