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
import com.example.data.service.CustomerService;
import com.example.data.service.UserService;

import net.sf.json.JSONObject;

/**
 * 文章控制器
 *
 */
@Controller
@RequestMapping("/customer")
public class CustomerController extends BaseController {

	@Resource
	CustomerService customerService;
	@Resource
	UserService userService;
	@Resource
	BusinessService businessService;

	@RequestMapping("/toCustomerManager.do")
	public String toCustomerManager(HttpSession session, Model model) {
		User user = getSessionUser(session);
		if (user == null) {
			return "redirect:/login/toLogin.do";
		}
		return "manager/customerManager";
	}

	@RequestMapping("/toAddCustomer.do")
	public String toAddCustomer(HttpSession session, Model model) {
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
		return "manager/customer/add";
	}

	@RequestMapping("/toCustomerList.do")
	public String toCustomerList(HttpSession session, Model model) {
		User user = getSessionUser(session);
		if (user == null) {
			return "redirect:/login/toLogin.do";
		}
		try {
			Customer customer = new Customer();
			List<Customer> cList = customerService.getCustomerByCondition(customer);
			model.addAttribute("uList", cList);
		} catch (Exception e) {
			model.addAttribute("errorMsg", e.getMessage());
			return "error/404";
		}
		return "manager/customer/updateList";
	}
	@RequestMapping("/toQueryCustomer.do")
	public String toQueryCustomer(HttpSession session, Model model) {
		User user = getSessionUser(session);
		if (user == null) {
			return "redirect:/login/toLogin.do";
		}
		return "manager/customer/query";
	}
	
	@RequestMapping("/queryCustomer.do")
	@ResponseBody
	public String queryUser(HttpSession session, String name) {
		RetParam<Customer> obj = new RetParam<>();
		User user = getSessionUser(session);
		try {
			if (user == null) {
				return "redirect:/login/toLogin.do";
			}
			Customer customer = new Customer();
			customer.setName(name);
			List<Customer> uList = customerService.getCustomerByCondition(customer);
			if (uList != null && uList.size() > 0) {
				obj.setRetCode("success");
				obj.setRetData(uList);
			}else{
				obj.setRetMsg("没有找到文章【"+name+"】");
				obj.setRetCode("failed");
			}
		} catch (Exception e) {
			obj.setRetMsg(e.getMessage());
			obj.setRetCode("failed");
		}
		return JSONObject.fromObject(obj).toString();
	}

	@RequestMapping("/toUpdateCustomer.do")
	public String toUpdateCustomer(HttpSession session, Model model, String userNo) {
		User user = getSessionUser(session);
		if (user == null) {
			return "redirect:/login/toLogin.do";
		}
		Customer customer = new Customer();
		customer.setNo(userNo);
		try {
			List<Customer> c = customerService.getCustomerByCondition(customer);
			model.addAttribute("customer", c.get(0));
		} catch (Exception e) {
			model.addAttribute("errorMsg", e.getMessage());
			return "error/404";
		}
		return "manager/customer/update";
	}

	@RequestMapping("/toBusinessList.do")
	public String toBusinessList(HttpSession session, Model model) {
		User user = getSessionUser(session);
		if (user == null) {
			return "redirect:/login/toLogin.do";
		}
		try {
			Business business = new Business();
			List<Business> c = businessService.getBusinessByCondition(business);
			model.addAttribute("uList",c);
		} catch (Exception e) {
			model.addAttribute("errorMsg", e.getMessage());
			return "error/404";
		}
		return "customer/businessList";
	}
	
	@RequestMapping("/details.do")
	public String details(HttpSession session, Model model,String no) {
		User user = getSessionUser(session);
		if (user == null) {
			return "redirect:/login/toLogin.do";
		}
		try {
			Customer customer = new Customer();
			customer.setNo(no);
			List<Customer> list = customerService.getCustomerByCondition(customer );
			model.addAttribute("customer",list.get(0));
		} catch (Exception e) {
			model.addAttribute("errorMsg", e.getMessage());
			return "error/404";
		}
		return "customer/details";
	}

	@RequestMapping("/toDeleteCustomer.do")
	public String toDeleteCustomer(HttpSession session, Model model) {
		User user = getSessionUser(session);
		if (user == null) {
			return "redirect:/login/toLogin.do";
		}
		try {
			Customer customer = new Customer();
			List<Customer> uList = customerService.getCustomerByCondition(customer);
			model.addAttribute("uList", uList);
		} catch (Exception e) {
			model.addAttribute("errorMsg", e.getMessage());
			return "error/404";
		}
		return "manager/customer/delete";
	}

	@RequestMapping("/addCustomer.do")
	@ResponseBody
	public String addCustomer(HttpSession session, Model model, Customer customer) {
		RetParam<Object> retParam = new RetParam<>();
		User user = getSessionUser(session);
		try {
			if (user == null) {
				throw new Exception("Please login first！");
			}
			if (customer == null || customer.getName().equals("") || customer.getMobile().equals("")) {
				throw new Exception("The parameter can not be empty！");
			}
			customer.setNo(user.getUserNo());
			customerService.insertCustomer(customer);
			retParam.setRetCode("success");
			retParam.setRetMsg("添加成功！");
		} catch (Exception e) {
			retParam.setRetCode("failed");
			retParam.setRetMsg(e.getMessage());
		}
		return JSONObject.fromObject(retParam).toString();
	}

	@RequestMapping("/deleteCustomer.do")
	@ResponseBody
	public String deleteCustomer(HttpSession session, Model model, String userNo) {
		RetParam<Object> retParam = new RetParam<>();
		User user = getSessionUser(session);
		try {
			if (user == null) {
				throw new Exception("Please login first！");
			}
			if (userNo.equals("")) {
				throw new Exception("Sorry, please pass in the parameters！");
			}
			customerService.deleteCustomerByCustomerNo(userNo);
			retParam.setRetCode("success");
			retParam.setRetMsg("删除成功！");
		} catch (Exception e) {
			retParam.setRetCode("failed");
			retParam.setRetMsg(e.getMessage());
		}
		return JSONObject.fromObject(retParam).toString();
	}

	@RequestMapping("/updateCustomer.do")
	@ResponseBody
	public String updateCustomer(HttpSession session, Model model, Customer customer) {
		RetParam<Object> retParam = new RetParam<>();
		User user = getSessionUser(session);
		try {
			if (user == null) {
				throw new Exception("Please login first！");
			}
			customerService.updateCustomerByCondition(customer);
			retParam.setRetCode("success");
			retParam.setRetMsg("update success！");
		} catch (Exception e) {
			retParam.setRetCode("failed");
			retParam.setRetMsg(e.getMessage());
		}
		return JSONObject.fromObject(retParam).toString();
	}
}
