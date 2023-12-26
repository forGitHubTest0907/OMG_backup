package com.oracle.OMG.dao.shDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.OMG.dto.Member;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ShMemberDaoImpl implements ShMemberDao {
	
	private final SqlSession session;
	
	//사원 등록 
	@Override
	public int createMember(Member member) {
		System.out.println("memberDao createMemeber() Start");
		int result = 0;
		try {
			result = session.insert("shCreateMember",member);
		} catch (Exception e) {
			System.out.println("memberDao createMember() Exception ->" + e.getMessage());
		}
		return result;
	}
	
	//멤버 리스트 조회용
	@Override
	public List<Member> memberList(Member member) {
		System.out.println("memberDao memberList() Start");
		List<Member> memberList = null;
		try {
			memberList = session.selectList("shMemberList",member);
		} catch (Exception e) {
			System.out.println("memberDao memberList() Exception ->" + e.getMessage());
		}
		return memberList;
	}
	
	//멤버 총 인원수
	@Override
	public int memberTotal() {
		System.out.println("memberDao memberTotal() Start");
		int total = 0;
		try {
			total = session.selectOne("shMemberTotal");
		} catch (Exception e) {
			System.out.println("memberDao memberList() Exception ->" + e.getMessage());
		}
		return total;
	}
	
	//리스트 검색 조건
	@Override
	public List<Member> memberSearchList(Member member) {
		System.out.println("memberDao memberSearchList() Start");
		List<Member> memberList = null;
		try {
			memberList = session.selectList("shMemberSearchList",member);
		} catch (Exception e) {
			System.out.println("memberDao memberList() Exception ->" + e.getMessage());
		}
		return memberList;
	}
	
	//조건에 적합한 인원수
	@Override
	public int searchMemberTotal(Member member) {
		System.out.println("memberDao searchMemberTotal() Start");
		int total = 0;
		try {
			total = session.selectOne("shSearchMemberTotal",member);
		} catch (Exception e) {
			System.out.println("memberDao searchMemberTotal() Exception ->" + e.getMessage());
		}
		return total;
	}

	@Override
	public Member searchMemberDetail(int mem_id) {
		// TODO Auto-generated method stub
		System.out.println("memberDao searchMemberDetail() Start");
		Member member = null;
		try {
			member = session.selectOne("shSearchMemberDetail",mem_id);
		} catch (Exception e) {
			System.out.println("memberDao searchMemberTotal() Exception ->" + e.getMessage());
		}
		return member;
	}

}
