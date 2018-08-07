package com.example.data.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.data.bean.RetParam;
import com.example.data.bean.User;
import com.example.data.service.UserService;

import net.sf.json.JSONObject;

/**
 *登录控制器
 */
@Controller
@RequestMapping("/login")
public class LoginController extends BaseController {
	
	Logger log = LoggerFactory.getLogger(this.getClass());

	@Resource
	UserService userService;
	
	@RequestMapping("/toIndex.do")
	public String toIndex(HttpSession session,Model model){
		User user = getSessionUser(session);
		log.debug("------------------------login jsp page------------------------");
		if(null==user)
		{
			return "redirect:/login/toLogin.do";
		}
		try {
			if(user.getAuth().equals("0")){
				model.addAttribute("errorMsg","请通知管理员先开发您的登录web权限后方可登录！");
				return "error/404";
			}
			model.addAttribute("user",user);
			
		} catch (Exception e) {
			model.addAttribute("errorMsg",e.getMessage());
			return "error/404";
		}
		return "index";
	}
	@RequestMapping("/toLogin.do")
	public String toLogin(){
		return "../../index";
	}
	@RequestMapping("/toExit.do")
	public String toExit(HttpSession session){
		session.removeAttribute("user");
		User user = (User) session.getAttribute("user");
		if(user!=null){
			session.setAttribute("user", null);
		}
		return "../../index";
	}
	
	//管理员登录网站
	@RequestMapping(value="/toCheckLogin.do")
	@ResponseBody
	public String toCheckLogin(User user,HttpSession session){
		RetParam<Object> param = new RetParam<Object>();
		try {
			if(null==user||user.getName().equals("")||user.getPsd().equals("")){
				throw new Exception("user param are not exists!!!");
			}
			List<User> uList = userService.getUserByCondition(user);
			if(null!=uList&&uList.size()>0){
				if(uList.get(0).getPsd().equals(user.getPsd()) && uList.get(0).getStatus().equals("2")){
					session.setAttribute("user", uList.get(0));
					param.setRetMsg("success");
				}else{
					param.setRetMsg("failed");
				}
			}else{
				param.setRetMsg("failed");
			}
			param.setRetCode("200");
		} catch (Exception e) {
			param.setRetMsg(e.getMessage());
			param.setRetCode("201");
		}
		return JSONObject.fromObject(param).toString();
	}
	
}
