package com.oracle.OMG.dto;

import lombok.Data;

@Data
public class Board {
	private int 	brd_id;
	private int 	mem_id;
	private int 	brd_lg;
	private int 	brd_md;
	private int 	qna_stts;
	private String 	title;
	private String	brd_cn;
	private String	atch_file;
	private int		view_cnt;
	private String	reg_date;
	private int		brd_group;
	private int		brd_step;
}
