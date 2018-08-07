package com.example.data.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.data.bean.Business;
import com.example.data.bean.Customer;
import com.example.data.bean.RetParam;
import com.example.data.bean.User;
import com.example.data.service.BusinessService;
import com.example.data.service.UserService;

import net.sf.json.JSONObject;

/**
 *商家控制器 
 *
 */
@Controller
@RequestMapping("/business")
public class BusinessController extends BaseController {

	@Resource
	BusinessService businessService;
	@Resource
	UserService userService;
	
	@RequestMapping("/toBusinessManager.do")
	public String toBusinessManager(HttpSession session, Model model) {
		User user = getSessionUser(session);
		if (user == null) {
			return "redirect:/login/toLogin.do";
		}
		return "manager/businessManager";
	}
	@RequestMapping("/toQueryBusiness.do")
	public String toQueryBusiness(HttpSession session, Model model) {
		User user = getSessionUser(session);
		if (user == null) {
			return "redirect:/login/toLogin.do";
		}
		return "manager/business/query";
	}

	@RequestMapping("/queryBusiness.do")
	@ResponseBody
	public String queryBusiness(HttpSession session, String name) {
		RetParam<Business> obj = new RetParam<>();
		User user = getSessionUser(session);
		try {
			if (user == null) {
				return "redirect:/login/toLogin.do";
			}
			Business business = new Business();
			business.setName(name);
			List<Business> uList = businessService.getBusinessByCondition(business);
			if (uList != null && uList.size() > 0) {
				obj.setRetCode("success");
				obj.setRetData(uList);
			}else{
				obj.setRetMsg("没有找到商家【"+name+"】");
				obj.setRetCode("failed");
			}
		} catch (Exception e) {
			obj.setRetMsg(e.getMessage());
			obj.setRetCode("failed");
		}
		return JSONObject.fromObject(obj).toString();
	}
	
	@RequestMapping("/toAddBusiness.do")
	public String toAddBusiness(HttpSession session, Model model) {
		User user = getSessionUser(session);
		if (user == null) {
			return "redirect:/login/toLogin.do";
		}
		try {
			User u = new User();
			u.setAuth("3");
			List<User> uList = userService.getUserByCondition(u);
			model.addAttribute("uList", uList);
		} catch (Exception e) {
			model.addAttribute("errorMsg", e.getMessage());
			return "error/404";
		}
		return "manager/business/add";
	}

	@RequestMapping("/toBusinessList.do")
	public String toBusinessList(HttpSession session, Model model) {
		User user = getSessionUser(session);
		if (user == null) {
			return "redirect:/login/toLogin.do";
		}
		try {
			Business Business = new Business();
			List<Business> cList = businessService.getBusinessByCondition(Business);
			model.addAttribute("uList", cList);
		} catch (Exception e) {
			model.addAttribute("errorMsg", e.getMessage());
			return "error/404";
		}
		return "manager/business/updateList";
	}

	@RequestMapping("/toUpdateBusiness.do")
	public String toUpdateBusiness(HttpSession session, Model model, String userNo) {
		User user = getSessionUser(session);
		if (user == null) {
			return "redirect:/login/toLogin.do";
		}
		try {
			Business business = new Business();
			if (user.getAuth().equals("0")) {
				business.setNo(user.getUserNo());
				model.addAttribute("limit", 1);
			} else {
				business.setNo(userNo);
			}
			List<Business> c = businessService.getBusinessByCondition(business);
			model.addAttribute("business", c.get(0));
		} catch (Exception e) {
			model.addAttribute("errorMsg", e.getMessage());
			return "error/404";
		}
		return "manager/business/update";
	}

	@RequestMapping("/toDeleteBusiness.do")
	public String toDeleteBusiness(HttpSession session, Model model) {
		User user = getSessionUser(session);
		if (user == null) {
			return "redirect:/login/toLogin.do";
		}
		try {
			Business Business = new Business();
			List<Business> uList = businessService.getBusinessByCondition(Business);
			model.addAttribute("uList", uList);
		} catch (Exception e) {
			model.addAttribute("errorMsg", e.getMessage());
			return "error/404";
		}
		return "manager/business/delete";
	}

	@RequestMapping("/addBusiness.do")
	@ResponseBody
	public String addBusiness(HttpSession session, Model model, Business business) {
		RetParam<Object> retParam = new RetParam<>();
		User user = getSessionUser(session);
		try {
			if (user == null) {
				throw new Exception("Please login first！");
			}
			if (business == null || business.getName().equals("") || business.getPhone().equals("")) {
				throw new Exception("The parameter can not be empty！");
			}
			businessService.insertBusiness(business);
			retParam.setRetCode("success");
			retParam.setRetMsg("添加成功！");
		} catch (Exception e) {
			retParam.setRetCode("failed");
			retParam.setRetMsg(e.getMessage());
		}
		return JSONObject.fromObject(retParam).toString();
	}

	@RequestMapping("/deleteBusiness.do")
	@ResponseBody
	public String deleteBusiness(HttpSession session, Model model, String userNo) {
		RetParam<Object> retParam = new RetParam<>();
		User user = getSessionUser(session);
		try {
			if (user == null) {
				throw new Exception("Please login first！");
			}
			if (userNo.equals("")) {
				throw new Exception("Sorry, please pass in the parameters！");
			}
			businessService.deleteBusinessByBusinessNo(userNo);
			retParam.setRetCode("success");
			retParam.setRetMsg("successfully deleted！");
		} catch (Exception e) {
			retParam.setRetCode("failed");
			retParam.setRetMsg(e.getMessage());
		}
		return JSONObject.fromObject(retParam).toString();
	}

	@RequestMapping("/updateBusiness.do")
	@ResponseBody
	public String updateBusiness(HttpSession session, Model model, Business business) {
		RetParam<Object> retParam = new RetParam<>();
		User user = getSessionUser(session);
		try {
			if (user == null) {
				throw new Exception("Please login first！");
			}
			businessService.updateBusinessByCondition(business);
			retParam.setRetCode("success");
			retParam.setRetMsg("update success！");
		} catch (Exception e) {
			retParam.setRetCode("failed");
			retParam.setRetMsg(e.getMessage());
		}
		return JSONObject.fromObject(retParam).toString();
	}

}
