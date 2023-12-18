package com.oracle.OMG.dao.thDao;

import java.util.List;

import com.oracle.OMG.dto.Board;
import com.oracle.OMG.dto.Criteria;

public interface ThNoticeDao {
	int					getTotNotice();
	List<Board> 		getNoticeList(Board board);
	List<Board>			getListWithPaging(Criteria cri);
	int					insertNotice(Board board);
	int					insertSelectKeyNotice(Board board);
	Board				readNotice(int brd_id);
	int					deleteNotice(int brd_id);
	int					updateNotice(Board board);
}
