package com.oracle.OMG.dao.yaDao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	//거래처 삭제
	@Override
	public int deleteCustomer(int custcode) {
		int deleteResult=0;
		System.out.println("YaCustomerDao deleteCustomer start...");
		try {
			deleteResult = session.delete("deleteCustomer", custcode);
		} catch (Exception e) {
			System.out.println("YaCustomerDaoImpl deleteCustomer  e.getMessage()?"+e.getMessage());
		}
		return deleteResult;
	}
	
	//거래처 검색
	@Override
	public List<Customer> customerSearch(String keyword, int start, int end) {
		List<Customer> customerSearch=null;
		System.out.println("YaCustomerDao  customerSearch start...");
		try {
			
	        Map<String, Object> parameters = new HashMap<>();
	        parameters.put("keyword", keyword);
	        parameters.put("start", start);
	        parameters.put("end", end);
			customerSearch= session.selectList("searchCustomer",parameters);
		} catch (Exception e) {
			System.out.println("YaCustomerDaoImpl customerSearch  e.getMessage()?"+e.getMessage());
		}
		return  customerSearch;
	}

	@Override
	public int totalSearch(String keyword) {
		int totalSearch = 0;
		System.out.println("YaCustomerDao  totalSearch start.. ");
	    try {
	        totalSearch = session.selectOne("totalSearch", keyword);
	    } catch (Exception e) {
	        System.out.println("YaCustomerDaoImpltotalSearch e.getMessage? " + e.getMessage());
	    }
		return totalSearch;
	}


}
