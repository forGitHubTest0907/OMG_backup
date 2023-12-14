package com.oracle.OMG.dao.thDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.OMG.dto.Board;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class ThNoticeDaoImpl implements ThNoticeDao {
	
	private final SqlSession session;
	
	@Override
	public int getTotNotice() {
		System.out.println("Dao getTotNotice");
		int totNotice = 0;
		try {			
			totNotice = session.selectOne("getTotNotice");
			System.out.println("totNotice --> " + totNotice);
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		return totNotice;
	}
	
	
	@Override
	public List<Board> getNoticeList(Board board) {
		List<Board> noticeList = null;
		try {
			noticeList = session.selectList("getNoticeList", board);
			System.out.println("noticeList.size() --> " + noticeList.size());
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		return noticeList;
	}

	@Override
	public int insertNotice(Board board) {
		int insertResult = 0;
		log.info("board : {}", board);
		try {
			insertResult = session.insert("insertNotice", board);
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		return insertResult;
	}

	@Override
	public int insertSelectKeyNotice(Board board) {
		int insertResult = 0;
		log.info("board: {}", board);
		try {
			insertResult = session.insert("insertNotice", board);
			
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		return insertResult;
	}

	@Override
	public Board readNotice(int brd_id) {
		Board notice = null;
		try {
			notice= session.selectOne("insertNotice", brd_id);
			log.info("notice: {}", notice);
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		return notice;
	}

	@Override
	public int deleteNotice(int brd_id) {
		int deleteResult = 0;
		try {
			deleteResult= session.delete("deleteNotice", brd_id);
			System.out.println("deleteResult --> " + deleteResult);
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		return deleteResult;
	}

	@Override
	public int updateNotice(Board board) {
		int updateResult = 0;
		try {
			updateResult = session.update("deleteNotice", board);
			System.out.println("updateResult --> " + updateResult );
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		return updateResult;
	}


}
