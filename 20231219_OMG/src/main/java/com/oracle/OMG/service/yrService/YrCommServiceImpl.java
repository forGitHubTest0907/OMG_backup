package com.oracle.OMG.service.yrService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.OMG.dao.yrDao.YrCommDao;
import com.oracle.OMG.dto.Comm;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class YrCommServiceImpl implements YrCommService {
	private final YrCommDao ycmd;
	
	@Override
	public List<Comm> commList() {
		System.out.println("YrCommServiceImpl commList start");
		List<Comm> comm = ycmd.commList();
		return comm;
	}
	
	
}
