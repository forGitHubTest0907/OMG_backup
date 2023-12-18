package com.oracle.OMG.service.shService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.OMG.dao.shDao.ShMemberDao;
import com.oracle.OMG.dto.Item;
import com.oracle.OMG.dto.Member;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ShMemberServiceImpl implements ShMemberService {

	private final ShMemberDao md;
	
	@Override
	public int createMember(Member member) {
		System.out.println("memberService createMember() Start");
		int result = md.createMember(member);
		return result;
	}

	@Override
	public List<Member> memberList(Member member) {
		System.out.println("memberService memberList() Start");
		List<Member> memberList = md.memberList(member);
		return memberList;
	}

	@Override
	public int memberTotal() {
		System.out.println("memberService memberTotal() Start");
		int total = md.memberTotal();
		return total;
	}

	@Override
	public List<Member> memberSearchList(Member member) {
		System.out.println("memberService memberSearchList() Start");
		List<Member> memberList = md.memberSearchList(member);
		return memberList;
	}


}
