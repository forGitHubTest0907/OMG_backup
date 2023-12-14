package com.oracle.OMG.service.main;

import org.springframework.stereotype.Service;

import com.oracle.OMG.dao.mainDao.MainMemberDao;
import com.oracle.OMG.dto.Member;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MainMemberServiceImpl implements MainMemberService {
	
	private final MainMemberDao MMemberD;
	
	// 노보경
	// 유저 정보 불러오는 메소드
	@Override
	public Member memSelectById(int mem_id) {
		
		System.out.println("MemberServiceImpl memSelectById Start...");
		
		Member mem = MMemberD.memSelectById(mem_id);
		
		return mem;
		
	}
	
	// 노보경
	// 유저 정보 불러오는 메소드
	@Override
	public Member memSelectByMem(Member member) {
		
		System.out.println("MemberServiceImpl memSelectByMem Start...");
		
		Member memResult = MMemberD.memSelectByMem(member);
		
		return memResult;
		
	}
	

}
