package com.oracle.OMG.service.shService;

import java.util.List;

import com.oracle.OMG.dto.Member;

public interface ShMemberService {

	int 		 createMember(Member member);
	List<Member> memberList(Member member);
	int			 memberTotal();
	List<Member> memberSearchList(Member member);
	int 		 searchMemberTotal(Member member);
	Member 		 searchMemberDetail(int mem_id);
	int 		 updateLeaveMember(Member member);
	int 		 updateReinMember(Member member);
	int 		 updateResiMember(Member member);
	int 		 updateMember(Member member);
	int 		 detailMember(Member member);
	List<Member> selectStatus();
}
