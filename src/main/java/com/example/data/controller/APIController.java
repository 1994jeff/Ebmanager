package com.example.data.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.data.bean.Customer;
import com.example.data.bean.RetParam;
import com.example.data.bean.User;
import com.example.data.service.CustomerService;
import com.example.data.service.UserService;
import com.example.data.utils.TextUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/api")
public class APIController extends BaseController {

	@Resource
	UserService userService;
	@Resource
	CustomerService customerService;
	
	@RequestMapping(value="/toCheckLogin.do")
	@ResponseBody
	public String toCheckLogin(User user){
		RetParam<User> param = new RetParam<User>();
		try {
			if(user.getTOKEN().equals(TOKEN)) {
				throw new Exception("token验证失败！");
			}
			if(TextUtil.isEmpty(user.getName())||TextUtil.isEmpty(user.getPsd())) {
				throw new Exception("登录名和密码不能为空!!!");
			}
			List<User> uList = userService.getUserByCondition(user);
			if(null!=uList&&uList.size()==1){
				param.setRetMsg("登录成功");
				param.setRetData(uList);
				param.setRetCode(SUCCESS_CODE);
			}else{
				param.setRetMsg("登录名或密码错误！");
				param.setRetCode(FAILED_CODE);
			}
		} catch (Exception e) {
			param.setRetMsg(e.getMessage());
			param.setRetCode(FAILED_CODE);
		}
		return JSONObject.fromObject(param,getJsonConfig()).toString();
	}
	
	@RequestMapping("/queryArticleByCondition.do")
	@ResponseBody
	public String queryArticleByCondition(Customer customer) {
		RetParam<Customer> obj = new RetParam<>();
		try {
			if(customer.getTOKEN().equals(TOKEN)) {
				obj.setRetMsg("token验证失败！");
				obj.setRetCode(FAILED_CODE);
				return JSONObject.fromObject(obj).toString();
			}
			List<Customer> uList = customerService.getCustomerByCondition(customer);
			obj.setRetCode(SUCCESS_CODE);
			obj.setRetData(uList);
		} catch (Exception e) {
			obj.setRetMsg(e.getMessage());
			obj.setRetCode(FAILED_CODE);
		}
		return JSONObject.fromObject(obj).toString();
	}
	
	@RequestMapping("/queryArticleByName.do")
	@ResponseBody
	public String queryArticleByName(String token,String name) {
		RetParam<Customer> obj = new RetParam<>();
		try {
			if(TOKEN.equals(token)) {
				throw new Exception("token验证失败！");
			}
			Customer customer = new Customer();
			customer.setName(name);
			List<Customer> uList = customerService.getCustomerByCondition(customer);
			if (uList != null && uList.size() > 0) {
				obj.setRetCode(SUCCESS_CODE);
				obj.setRetData(uList);
			}else{
				obj.setRetMsg("没有找到文章【"+name+"】");
				obj.setRetCode(FAILED_CODE);
			}
		} catch (Exception e) {
			obj.setRetMsg(e.getMessage());
			obj.setRetCode(FAILED_CODE);
		}
		return JSONObject.fromObject(obj).toString();
	}
	
}
