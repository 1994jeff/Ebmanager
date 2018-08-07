package com.example.data.service;

import java.util.List;

import com.example.data.bean.Business;

public interface BusinessService {

	void updateBusinessByCondition(Business business) throws Exception;
	
	void addBusinessByCondition(Business business) throws Exception;
	
	void insertBusiness(Business business) throws Exception;

	void deleteBusinessByBusinessNo(String no) throws Exception;

	List<Business> getBusinessByCondition(Business business) throws Exception;
}
