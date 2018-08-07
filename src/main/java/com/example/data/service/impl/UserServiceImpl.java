package com.example.data.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.data.bean.Business;
import com.example.data.bean.Customer;
import com.example.data.bean.User;
import com.example.data.dao.UserDao;
import com.example.data.service.BusinessService;
import com.example.data.service.CustomerService;
import com.example.data.service.UserService;
import com.example.data.utils.DomainNoUtils;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource
	UserDao userDao;
	@Resource
	CustomerService customerService;
	@Resource
	BusinessService businessService;
	
	
	@Override
	public List<User> getUserByCondition(User user) throws Exception {
		try {
			return userDao.getUserByCondition(user);
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}

	@Override
	public void updateUserByCondition(User user) throws Exception {
		try {
			userDao.updateUserByCondition(user);
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}

	@Override
	public void insertUser(User auser) throws Exception {
		try {
			User s = new User();
			s.setName(auser.getName());
			if(userDao.getUserByCondition(s).size()>0){
				throw new Exception("添加失败! 用户名【"+auser.getName()+"】已存在！");
			}
			String userNo = DomainNoUtils.getNoByPreStr(DomainNoUtils.USER_NO);
			auser.setUserNo(userNo);
			Date d = new Date();
			auser.setCreateTime(d);
			userDao.insertUser(auser);
			
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}

	@Override
	public void deleteUserByUserNo(String userNo) throws Exception {
		try {
			User user = new User();
			user.setUserNo(userNo);
			List<User> u = userDao.getUserByCondition(user);
			for(int i=0;i<u.size();i++);{
				if(u.get(0).getAuth().equals("1"))
				{
					throw new Exception("对不起，管理员用户无法删除！");
				}
			}
			userDao.deleteUserByUserNo(userNo);
			businessService.deleteBusinessByBusinessNo(userNo);
			customerService.deleteCustomerByCustomerNo(userNo);
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}

}
