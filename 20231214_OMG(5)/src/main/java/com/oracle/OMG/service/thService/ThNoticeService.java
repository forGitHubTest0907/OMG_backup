package com.oracle.OMG.service.thService;

import java.util.List;

import com.oracle.OMG.dto.Board;

public interface ThNoticeService {
	int					getNoticeTot();
	List<Board> 		getNoticeList(Board board);
	int					registerNotice(Board board);
	Board				getNotice(int brd_id);
	int					removeNotice(int brd_id);
	int					modifyNotice(Board board);
}
