package com.example.data.dao;

import java.util.List;

import com.example.data.bean.Customer;

public interface CustomerDao {
	
	void updateCustomerByCondition(Customer customer);
	
	void insertCustomer(Customer customer);

	void deleteCustomerByCustomerNo(String no);

	List<Customer> getCustomerByCondition(Customer customer);
}
