package com.oracle.OMG.service.thService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.OMG.dao.thDao.ThNoticeDao;
import com.oracle.OMG.dto.Board;
import com.oracle.OMG.dto.Criteria;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ThNoticeServiceImpl implements ThNoticeService {

	private final ThNoticeDao nd;

	@Override
	public int getNoticeTot() {
		log.info("tot...");
		return nd.getTotNotice();
	}

//	@Override
//	public List<Board> getNoticeList(Board board) {
//		log.info("getList....");
//		return nd.getNoticeList(board);
//	}
	
	@Override
	public List<Board> getNoticeList(Criteria cri) {
		log.info("get List with criteria: " + cri);
		return nd.getListWithPaging(cri);
	}
	

	@Override
	public int registerNotice(Board board) {
		log.info("board -->" +  board);
		return nd.insertSelectKeyNotice(board);
	}

	@Override
	public Board getNotice(int brd_id) {
		log.info("get brd_id: " + brd_id );
		return nd.readNotice(brd_id);
	}

	@Override
	public int removeNotice(int brd_id) {
		log.info("remove brd_id: " + brd_id);
		return nd.deleteNotice(brd_id);
	}

	@Override
	public int modifyNotice(Board board) {
		log.info("modify board: " + board);
		return nd.updateNotice(board);
	}



	
}
