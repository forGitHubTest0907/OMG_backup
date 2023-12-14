package com.oracle.OMG.service.yrService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.OMG.dao.yrDao.YrCustomerDao;
import com.oracle.OMG.dto.Customer;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class YrCustomerServiceImpl implements YrCustomerService {
	private final YrCustomerDao ycmd;
	
	@Override
	public List<Customer> customerList() {
		System.out.println("YrCustomerServiceImpl customerList start");
		List<Customer> customer = ycmd.customerList();
		return customer;
	}

	
}
