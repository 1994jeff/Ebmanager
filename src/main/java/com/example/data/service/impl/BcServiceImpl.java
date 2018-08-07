package com.example.data.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.data.bean.Bc;
import com.example.data.bean.BcDto;
import com.example.data.bean.Business;
import com.example.data.dao.BcDao;
import com.example.data.service.BcService;
import com.example.data.service.BusinessService;
import com.example.data.utils.DomainNoUtils;

@Service("bcService")
public class BcServiceImpl implements BcService {

	@Resource
	BcDao bcDao;
	@Resource
	BusinessService businessService;
	
	@Override
	public void insertBc(Bc bc) throws Exception {
		try {
			Business business = new Business();
			business.setNo(bc.getbNo());
			List<Business> list = businessService.getBusinessByCondition(business );
			if(list!=null && list.size()>0){
				if(list.get(0).getType().equals("")){
					throw new Exception("此商家产品信息尚未初始化，处于不可用状态，请等待管理员更新商家信息后再购买产品！");
				}
			}else{
				throw new Exception("编号【"+bc.getbNo()+"】的商家不存在！请刷新页面重试！");
			}
			String bcNo = DomainNoUtils.getNoByPreStr("BCN");
			bc.setBcNo(bcNo);
			bcDao.insertBc(bc);
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}

	@Override
	public List<Bc> getBcByCondition(Bc bc) throws Exception {
		List<Bc> list = null;
		try {
			list = bcDao.getBcByCondition(bc);
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
		return list;
	}

	@Override
	public List<BcDto> getBcDtoByConditon(Bc bc) throws Exception {
		List<BcDto> list = null;
		try {
			list = bcDao.getBcDtoByConditon(bc);
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
		return list;
	}


}
