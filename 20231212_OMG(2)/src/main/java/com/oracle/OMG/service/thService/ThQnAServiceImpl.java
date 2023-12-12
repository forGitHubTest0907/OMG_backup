package com.oracle.OMG.service.thService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.OMG.dao.thDao.ThQnADao;
import com.oracle.OMG.dto.Board;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ThQnAServiceImpl implements ThQnAService {

	private final ThQnADao qd;
	
	@Override
	public int totalQnA() {
		System.out.println("ThQnAServiceImpl totalQnA Start");
		int totQnA = qd.totalQnA();
		System.out.println("ThQnAServiceImpl totalQnA --> " + totQnA);
		return totQnA;
	}

	@Override
	public List<Board> selectQnAList(Board board) {
		System.out.println("ThQnAServiceImpl selectQnAList Start");
		List<Board> QnAList = qd.selectQnAList(board);
		return QnAList;
	}

	
}
