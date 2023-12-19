package com.oracle.OMG.service.shService;

import java.util.List;

import com.oracle.OMG.dto.Member;

public interface ShMemberService {

	int 		 createMember(Member member);
	List<Member> memberList(Member member);
	int			 memberTotal();
	List<Member> memberSearchList(Member member);
}
