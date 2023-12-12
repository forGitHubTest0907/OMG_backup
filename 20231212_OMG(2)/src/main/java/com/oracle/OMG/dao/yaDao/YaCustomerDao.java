package com.oracle.OMG.dao.yaDao;

import java.util.List;

import com.oracle.OMG.dto.Customer;
import com.oracle.OMG.dto.Member;

public interface YaCustomerDao {

	List<Customer> customerList(Customer customer);
	int            totalCustomer(Customer customer);
	Customer       customerDetail(int custcode);
	List<Member>   memberList(Member member);
	Customer       updateCustomer(Customer customer);
	Customer       insertCustomer(Customer customer);
	int            deleteCustomer(int custcode);
	List<Customer> customerSearch(String keyword, int start, int end);
	int            totalSearch(String keyword);

}
