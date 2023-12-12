package com.oracle.OMG.dao.yaDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.OMG.dto.Customer;
import com.oracle.OMG.dto.Member;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class YaCustomerDaoImpl implements YaCustomerDao {
	private final SqlSession session;

	@Override
	//거래처 전체조회
	public List<Customer> customerList(Customer customer) {
		System.out.println("YaCustomerDao customerList dao start....");
		List<Customer>customerList = null;
		try {
			customerList = session.selectList("customerList", customer);
			System.out.println("YaCustomerDaoImpl customerList communityList.size()?"+customerList.size());
		} catch (Exception e) {
			System.out.println("YaCustomerDaoImpl  listCommunity e.getMessage()?"+e.getMessage());
		}
		
		return customerList;
	}

	@Override
	public int totalCustomer(Customer customer) {
		System.out.println("YaCustomerDao totalCustomer start...");
		int totalCustomer = 0;
		try {
			totalCustomer = session.selectOne("totalCustomer", totalCustomer);
		} catch (Exception e) {
			System.out.println("YaCustomerDaoImpl totalCustomer e.getMessage()?"+e.getMessage());
		}
		return  totalCustomer;
	}

	@Override
	//거래처 상세보기
	public Customer customerDetail(int custcode) {
		System.out.println("YaCustomerDao customerDetail start...");
		Customer customer = new Customer();
		try {
			customer = session.selectOne("customerOne", custcode);
		} catch (Exception e) {
			System.out.println("YaCustomerDaoImpl customerDetail e.getMessage()?"+e.getMessage());
		}
		return customer;		
	}

	@Override
	//사원전체조회
	public List<Member> memberList(Member member) {
		System.out.println("YaCustomerDao List<Member> memberList start...");
		 List<Member> memberList = null;
		try {		
			 memberList=session.selectList("CmemberList", member);
		} catch (Exception e) {
			System.out.println("YaCustomerDaoImpl memberList e.getMessage()?"+e.getMessage());
		}
		return memberList;
		
	}	
	@Override
	public Customer updateCustomer(Customer customer) {
		System.out.println("YaCustomerDao updateCustomer start...");
		try {
				session.update("updateCustomer",customer);				
		} catch (Exception e) {
			System.out.println("YaCustomerDaoImpl customerDetail e.getMessage()?"+e.getMessage());
		}
		return customer;
	}
	
	@Override
	//거래처등록
	public Customer insertCustomer(Customer customer) {
		System.out.println("YaCustomerDao insertCustomer start...");
		try {
			session.insert("insertCustomer", customer);
		} catch (Exception e) {
			System.out.println("YaCustomerDaoImpl insertCustomer e.getMessage()?"+e.getMessage());
		}
		
		return customer;
	}


}
