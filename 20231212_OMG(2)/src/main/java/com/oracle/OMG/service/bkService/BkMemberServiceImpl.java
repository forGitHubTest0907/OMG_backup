package com.oracle.OMG.service.bkService;

import org.springframework.stereotype.Service;

import com.oracle.OMG.dao.bkDao.BkMemberDao;
import com.oracle.OMG.dto.Member;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BkMemberServiceImpl implements BkMemberService {
	
	private final BkMemberDao bMemberD;

	@Override
	public Member login(Member member) {
		
		System.out.println("BkMemberServiceImpl login Start...");
		Member loginUser = bMemberD.login(member);
		System.out.println("BkMemberServiceImpl login loginUser -> " + loginUser);
		
		return loginUser;
	}
	
	

}
