package com.example.data.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.data.bean.Business;
import com.example.data.bean.Customer;
import com.example.data.bean.User;
import com.example.data.dao.CustomerDao;
import com.example.data.service.BusinessService;
import com.example.data.service.CustomerService;
import com.example.data.service.UserService;
import com.example.data.utils.DomainNoUtils;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService {

	@Resource
	CustomerDao customerDao;
	@Resource
	BusinessService businessService;
	@Resource
	UserService userService;
	
	@Override
	public void insertCustomer(Customer customer) throws Exception {
		try {
			Customer customer3 = new Customer();
			customer3.setName(customer.getName());
			List<Customer> c = customerDao.getCustomerByCondition(customer3);
			if(c!=null && c.size()>0){
				throw new Exception("添加失败，文章名【"+customer.getName()+"】已被使用！");
			}
			customer.setNo(DomainNoUtils.getNoByPreStr(DomainNoUtils.BC_NO));
			customerDao.insertCustomer(customer);
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}

	@Override
	public void deleteCustomerByCustomerNo(String userNo) throws Exception {
		try {
			customerDao.deleteCustomerByCustomerNo(userNo);
			User user = new User();
			user.setUserNo(userNo);
			user.setAuth("3");
			userService.updateUserByCondition(user );
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}

	@Override
	public List<Customer> getCustomerByCondition(Customer customer) throws Exception {
		List<Customer> list = null;
		try {
			list = customerDao.getCustomerByCondition(customer);
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
		return list;
	}

	@Override
	public void updateCustomerByCondition(Customer customer) throws Exception {
		try {
			Customer customer2 = new Customer();
			customer2.setName(customer.getName());
			List<Customer> cList = customerDao.getCustomerByCondition(customer2);
			if (cList != null && cList.size() > 0) {
				if(!cList.get(0).getNo().equals(customer.getNo())){
					throw new Exception("文章名【"+customer.getName()+"】已存在，请更换！");
				}
			}
			customerDao.updateCustomerByCondition(customer);
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}

}
