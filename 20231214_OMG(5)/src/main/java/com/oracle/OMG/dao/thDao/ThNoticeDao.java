package com.oracle.OMG.dao.thDao;

import java.util.List;

import com.oracle.OMG.dto.Board;

public interface ThNoticeDao {
	int					getTotNotice();
	List<Board> 		getNoticeList(Board board);
	int					insertNotice(Board board);
	int					insertSelectKeyNotice(Board board);
	Board				readNotice(int brd_id);
	int					deleteNotice(int brd_id);
	int					updateNotice(Board board);
}
