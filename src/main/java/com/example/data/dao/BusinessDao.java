package com.example.data.dao;

import java.util.List;

import com.example.data.bean.Business;

public interface BusinessDao {
	
	void updateBusinessByCondition(Business business);
	
	void insertBusiness(Business business);

	void deleteBusinessByBusinessNo(String no);

	List<Business> getBusinessByCondition(Business business);
}
