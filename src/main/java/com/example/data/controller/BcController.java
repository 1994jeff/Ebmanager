package com.example.data.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.data.bean.Bc;
import com.example.data.bean.BcDto;
import com.example.data.bean.Business;
import com.example.data.bean.RetParam;
import com.example.data.bean.User;
import com.example.data.service.BcService;
import com.example.data.service.BusinessService;
import com.example.data.service.CustomerService;

import net.sf.json.JSONObject;

/**
 * 
 * 文章商家控制器
 *
 */
@Controller
@RequestMapping("/bc")
public class BcController extends BaseController {

	@Resource
	BcService bcService;
	@Resource
	BusinessService businessService;
	@Resource
	CustomerService customerService;

	@RequestMapping("/toBuyProduct.do")
	public String toBuyProduct(Model model, HttpSession session, String bNo) {
		User user = getSessionUser(session);
		if (user == null) {
			return "redirect:/login/toLogin.do";
		}
		try {
			Business business = new Business();
			business.setNo(bNo);
			List<Business> businesses = businessService.getBusinessByCondition(business);
			model.addAttribute("business", businesses.get(0));
			model.addAttribute("price", (businesses.get(0).getLevel()+1)*10);
		} catch (Exception e) {
			model.addAttribute("errorMsg", e.getMessage());
			return "error/404";
		}
		return "customer/product";
	}
	
	@RequestMapping("/toBuyList.do")
	public String toBuyList(Model model, HttpSession session) {
		User user = getSessionUser(session);
		if (user == null) {
			return "redirect:/login/toLogin.do";
		}
		try {
			Bc bc = new Bc();
			bc.setcNo(user.getUserNo());
			bc.setOrder(0);
			List<BcDto> list = bcService.getBcDtoByConditon(bc);
			model.addAttribute("list", list);
		} catch (Exception e) {
			model.addAttribute("errorMsg", e.getMessage());
			return "error/404";
		}
		return "customer/buyList";
	}
	@RequestMapping("/toSaleList.do")
	public String toSaleList(Model model, HttpSession session,String type) {
		User user = getSessionUser(session);
		if (user == null) {
			return "redirect:/login/toLogin.do";
		}
		try {
			Bc bc = new Bc();
			if(user.getAuth().equals("0"))
			{
				bc.setbNo(user.getUserNo());
			}
			if(type==null || type.equals(""))
			{				
				bc.setOrder(0);
			}else if(type.equals("1")){
				bc.setOrder(1);
			}else if(type.equals("2")){
				bc.setOrder(2);
			}
			List<BcDto> list = bcService.getBcDtoByConditon(bc);
			model.addAttribute("list", list);
		} catch (Exception e) {
			model.addAttribute("errorMsg", e.getMessage());
			return "error/404";
		}
		return "business/saleList";
	}
	
	@RequestMapping("/buyProduct.do")
	@ResponseBody
	public String buyProduct(Model model, HttpSession session, String no,int price,int nums) {
		RetParam<Object> retParam = new RetParam<>();
		User user = getSessionUser(session);
		try {
			if (user == null) {
				throw new Exception("Please login first！");
			}
			Bc bc = new Bc();
			bc.setbNo(no);
			bc.setcNo(user.getUserNo());
			bc.setMoney(price);
			bc.setNum(nums);
			bcService.insertBc(bc);
			retParam.setRetCode("success");
			retParam.setRetMsg("购买成功！");
		} catch (Exception e) {
			retParam.setRetCode("failed");
			retParam.setRetMsg(e.getMessage());
		}
		return JSONObject.fromObject(retParam).toString();
	}
}
