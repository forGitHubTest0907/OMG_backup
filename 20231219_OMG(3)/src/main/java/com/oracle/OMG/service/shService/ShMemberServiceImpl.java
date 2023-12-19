package com.oracle.OMG.service.shService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.OMG.dao.shDao.ShMemberDao;
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
	public int memberLeave(int mem_id) {
		System.out.println("memberService memberList() Start");
		int result = md.memberLeave(mem_id);
		return result;
	}
	
	@Override
	public int memberResign(int mem_id) {
		System.out.println("memberService memberResign() Start");
		int result = md.memberResign(mem_id);
		return result;
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

	@Override
	public int searchMemberTotal(Member member) {
		System.out.println("memberService searchMemberTotal() Start");
		int total = md.searchMemberTotal(member);
		return total;
	}

	@Override
	public Member searchMemberDetail(int mem_id) {
		System.out.println("memberService searchMemberDetail() Start");
		Member member = md.searchMemberDetail(mem_id);
		return member;
	}




}
