package com.example.data.service;

import java.util.List;

import com.example.data.bean.Customer;

public interface CustomerService {

	void insertCustomer(Customer customer) throws Exception;

	void deleteCustomerByCustomerNo(String userNo) throws Exception;

	List<Customer> getCustomerByCondition(Customer customer) throws Exception;

	void updateCustomerByCondition(Customer customer) throws Exception;

}
