package com.oracle.OMG.dao.shDao;

import java.util.List;

import com.oracle.OMG.dto.Member;

public interface ShMemberDao {

	int 	 	 createMember(Member member);
	List<Member> memberList(Member member);
	int 		 memberTotal();
	List<Member> memberSearchList(Member member);
	int 		 searchMemberTotal(Member member);
}
