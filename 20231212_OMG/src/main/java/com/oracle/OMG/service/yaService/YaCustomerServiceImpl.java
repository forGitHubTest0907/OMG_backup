package com.oracle.OMG.service.yaService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.OMG.dao.yaDao.YaCustomerDao;
import com.oracle.OMG.dto.Customer;
import com.oracle.OMG.dto.Member;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class YaCustomerServiceImpl implements YaCustomerService {
	private final YaCustomerDao ycd;

	@Override
	//거래처 전체조회
	public List<Customer> customerList(Customer customer) {
		System.out.println("YaCustomerService CustomerList List<Customer> customerList start....");
		
		List<Customer> customerList = ycd.customerList(customer);
		System.out.println("YaCustomerServiceImpl YaCustomerList.size()?"+customerList.size());
		return customerList;
	}
	
	@Override
	//거래처 수
	public int totalCustomer(Customer customer) {
		System.out.println("YaCustomerService totalCustomer start....");
		int totalCustomer = ycd.totalCustomer(customer);
		System.out.println("YaCustomerServiceImpl totalCustoemr start....");
		
		
		return totalCustomer;
	}

	@Override
	//거래처 상세보기
	public Customer customerDetail(int custcode) {
		System.out.println("YaCustomerService customerDetail start...");
		Customer customer = null;
		customer = ycd.customerDetail(custcode);
		return customer;
	}

	@Override
	//거래처 수정
	public Customer updateCustomer(Customer customer) {
		System.out.println("YaCustomerService updateCustomer start...");
		customer = ycd.updateCustomer(customer);
		return customer;
	}

	@Override
	//사원조회
	public List<Member> memberList(Member member) {
		System.out.println("YaCustomerService memberList start...");
		List<Member> memberList = ycd.memberList(member);
		return memberList;
	}
	
	//거래처등록
	@Override
	public Customer insertCustomer(Customer customer) {
		System.out.println("YaCustomerService insertCustomer start...");
		customer = ycd.insertCustomer(customer);
		return customer;
		
	}
		
		
}
