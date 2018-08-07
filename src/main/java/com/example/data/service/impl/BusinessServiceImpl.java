package com.example.data.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.data.bean.Business;
import com.example.data.bean.Customer;
import com.example.data.bean.User;
import com.example.data.dao.BusinessDao;
import com.example.data.service.BusinessService;
import com.example.data.service.UserService;

@Service("businessService")
public class BusinessServiceImpl implements BusinessService {

	@Resource
	BusinessDao businessDao;
	@Resource
	UserService userService;
	@Override
	public void updateBusinessByCondition(Business business) throws Exception {
		try {
			Business business2 = new Business();
			business2.setName(business.getName());
			List<Business> cList = businessDao.getBusinessByCondition(business2);
			if (cList != null && cList.size() > 0) {
				if(!cList.get(0).getNo().equals(business.getNo())){
					throw new Exception("商家名【"+business.getName()+"】已存在，请更换！");
				}
			}
			businessDao.updateBusinessByCondition(business);
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}

	@Override
	public void addBusinessByCondition(Business business) throws Exception {
		try {
			businessDao.insertBusiness(business);
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}

	@Override
	public void insertBusiness(Business business) throws Exception {
		try {
			User user = new User();
			user.setUserNo(business.getNo());
			if(userService.getUserByCondition(user).get(0).getAuth().equals("3")){
				Business business2 = new Business();
				business2.setName(business.getName());
				List<Business> c = businessDao.getBusinessByCondition(business2);
				if(c!=null && c.size()>0){
					throw new Exception("添加失败，商家名【"+business.getName()+"】已被使用！");
				}
				businessDao.insertBusiness(business);
				user.setAuth("0");
				userService.updateUserByCondition(user);
			}else{
				throw new Exception("添加失败，此用户的文章/商家身份已存在！");
			}
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}

	@Override
	public void deleteBusinessByBusinessNo(String no) throws Exception {
		try {
			businessDao.deleteBusinessByBusinessNo(no);
			User user = new User();
			user.setUserNo(no);
			user.setAuth("3");
			userService.updateUserByCondition(user );
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}

	@Override
	public List<Business> getBusinessByCondition(Business business) throws Exception {
		List<Business> list = null;
		try {
			list = businessDao.getBusinessByCondition(business);
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
		return list;
	}

}
