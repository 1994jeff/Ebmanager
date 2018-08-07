package com.example.data.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.data.bean.RetParam;
import com.example.data.bean.User;
import com.example.data.service.UserService;

import net.sf.json.JSONObject;

/**
 * 用户控制器
 */
@Controller
@RequestMapping("user")
public class UserController extends BaseController {

	Logger log = LoggerFactory.getLogger(getClass());

	@Resource
	UserService userService;

	@RequestMapping("/toModifyPsd.do")
	public String toModifyPsd(HttpSession session) {
		User user = getSessionUser(session);
		if (user == null) {
			return "redirect:/login/toLogin.do";
		}
		return "user/modifyPsd";
	}

	@RequestMapping("/toQueryUser.do")
	public String toQueryUser(HttpSession session) {
		User user = getSessionUser(session);
		if (user == null) {
			return "redirect:/login/toLogin.do";
		}
		return "manager/user/query";
	}

	@RequestMapping("/modifyPsd.do")
	@ResponseBody
	public String modifyPsd(HttpSession session, String psd, String newPsd) {
		RetParam<Object> obj = new RetParam<>();
		User user = getSessionUser(session);
		try {
			if (user == null) {
				return "redirect:/login/toLogin.do";
			}
			if (user.getPsd().equals(psd)) {
				if(psd.equals(newPsd)){
					throw new Exception("新旧密码不能一样！");
				}
				user.setPsd(newPsd);
				userService.updateUserByCondition(user);
				session.setAttribute("user", null);
				obj.setRetCode("success");
			} else {
				throw new Exception("旧密码错误！");
			}
		} catch (Exception e) {
			obj.setRetMsg(e.getMessage());
			obj.setRetCode("failed");
		}
		return JSONObject.fromObject(obj).toString();
	}

	@RequestMapping("/queryUser.do")
	@ResponseBody
	public String queryUser(HttpSession session, String name) {
		RetParam<User> obj = new RetParam<>();
		User user = getSessionUser(session);
		try {
			if (user == null) {
				return "redirect:/login/toLogin.do";
			}
			User u = new User();
			u.setName(name);
			List<User> uList = userService.getUserByCondition(u);
			if (uList != null && uList.size() > 0) {
				obj.setRetCode("success");
				obj.setRetData(uList);
			}else{
				obj.setRetMsg("没有找到用户【"+name+"】");
				obj.setRetCode("failed");
			}
		} catch (Exception e) {
			obj.setRetMsg(e.getMessage());
			obj.setRetCode("failed");
		}
		return JSONObject.fromObject(obj).toString();
	}

	@RequestMapping("/toUserManager.do")
	public String toUserManager(HttpSession session, Model model) {
		User user = getSessionUser(session);
		if (user == null) {
			return "redirect:/login/toLogin.do";
		}
		return "manager/userManager";
	}

	@RequestMapping("/toAddUser.do")
	public String toAddUser(HttpSession session, Model model) {
		User user = getSessionUser(session);
		if (user == null) {
			return "redirect:/login/toLogin.do";
		}
		return "manager/user/add";
	}

	@RequestMapping("/toUserList.do")
	public String toUserList(HttpSession session, Model model) {
		User user = getSessionUser(session);
		if (user == null) {
			return "redirect:/login/toLogin.do";
		}
		try {
			User u = new User();
			List<User> uList = userService.getUserByCondition(u);
			model.addAttribute("uList", uList);
		} catch (Exception e) {
			model.addAttribute("errorMsg", e.getMessage());
			return "error/404";
		}
		return "manager/user/updateList";
	}

	@RequestMapping("/toUpdateUser.do")
	public String toUpdateUser(HttpSession session, Model model, String userNo) {
		User user = getSessionUser(session);
		if (user == null) {
			return "redirect:/login/toLogin.do";
		}
		User u = new User();
		u.setUserNo(userNo);
		try {
			List<User> users = userService.getUserByCondition(u);
			model.addAttribute("user", users.get(0));
		} catch (Exception e) {
			model.addAttribute("errorMsg", e.getMessage());
			return "error/404";
		}
		return "manager/user/update";
	}

	@RequestMapping("/toDeleteUser.do")
	public String toDeleteUser(HttpSession session, Model model) {
		User user = getSessionUser(session);
		if (user == null) {
			return "redirect:/login/toLogin.do";
		}
		try {
			User u = new User();
			List<User> uList = userService.getUserByCondition(u);
			model.addAttribute("uList", uList);
		} catch (Exception e) {
			model.addAttribute("errorMsg", e.getMessage());
			return "error/404";
		}
		return "manager/user/delete";
	}

	@RequestMapping("/addUser.do")
	@ResponseBody
	public String addUser(HttpSession session, Model model, User auser) {
		RetParam<Object> retParam = new RetParam<>();
		User user = getSessionUser(session);
		try {
			if (user == null) {
				throw new Exception("Please login first！");
			}
			if (auser == null || auser.getName().equals("") || auser.getPsd().equals("")) {
				throw new Exception("The registration parameter can not be empty！");
			}
			auser.setAuth("3");
			userService.insertUser(auser);
			retParam.setRetCode("success");
			retParam.setRetMsg("注册用户成功！");
		} catch (Exception e) {
			retParam.setRetCode("failed");
			retParam.setRetMsg(e.getMessage());
		}
		return JSONObject.fromObject(retParam).toString();
	}

	@RequestMapping("/deleteUser.do")
	@ResponseBody
	public String deleteUser(HttpSession session, Model model, String userNo) {
		RetParam<Object> retParam = new RetParam<>();
		User user = getSessionUser(session);
		try {
			if (userNo.equals("")) {
				throw new Exception("Sorry, please pass in the parameters！");
			}
			userService.deleteUserByUserNo(userNo);
			retParam.setRetCode("success");
			retParam.setRetMsg("successfully deleted！");
		} catch (Exception e) {
			retParam.setRetCode("failed");
			retParam.setRetMsg(e.getMessage());
		}
		return JSONObject.fromObject(retParam).toString();
	}

	@RequestMapping("/updateUser.do")
	@ResponseBody
	public String updateUser(HttpSession session, Model model, User auser) {
		RetParam<Object> retParam = new RetParam<>();
		User user = getSessionUser(session);
		try {
			if (user == null) {
				throw new Exception("Please login first！");
			}
//			User u = new User();
//			u.setUserNo(auser.getUserNo());
//			List<User> old = userService.getUserByCondition(u);
//			if(old.get(0).getPsd().equals(auser.getPsd())){
//				throw new Exception("新密码不能和原密码一致！");
//			}
			userService.updateUserByCondition(auser);
			retParam.setRetCode("success");
			retParam.setRetMsg("update success！");
		} catch (Exception e) {
			retParam.setRetCode("failed");
			retParam.setRetMsg(e.getMessage());
		}
		return JSONObject.fromObject(retParam).toString();
	}

}
