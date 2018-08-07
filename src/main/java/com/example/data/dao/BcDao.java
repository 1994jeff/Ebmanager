package com.example.data.dao;

import java.util.List;

import com.example.data.bean.Bc;
import com.example.data.bean.BcDto;

public interface BcDao {
	
	void updateBcByCondition(Bc bc);
	
	void addBcByCondition(Bc bc);
	
	void insertBc(Bc bc);

	void deleteBcByBcNo(String no);

	List<Bc> getBcByCondition(Bc bc);

	List<BcDto> getBcDtoByConditon(Bc bc);
}
