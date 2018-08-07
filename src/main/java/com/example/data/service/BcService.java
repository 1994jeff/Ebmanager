package com.example.data.service;

import java.util.List;

import com.example.data.bean.Bc;
import com.example.data.bean.BcDto;

public interface BcService {

	void insertBc(Bc bc) throws Exception;

	List<Bc> getBcByCondition(Bc bc)throws Exception;

	List<BcDto> getBcDtoByConditon(Bc bc) throws Exception;

}
