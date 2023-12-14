package com.oracle.OMG.dao.yrDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.OMG.dto.Customer;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class YrCustomerDaoImpl implements YrCustomerDao {
	private final SqlSession session;
	
	@Override
	public List<Customer> customerList() {
		System.out.println("YrCustomerDaoImpl customerList start");
		List<Customer> customer = null;
		try {
			customer = session.selectList("yrCustomerSelectList");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return customer;
	}

	
}
