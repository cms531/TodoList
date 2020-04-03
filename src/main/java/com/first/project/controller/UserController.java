package com.first.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.first.project.dto.UserVo;
import com.first.project.service.AllService;

@Controller
public class UserController {

	@Autowired
	AllService service;
	
	@RequestMapping(value="/loginUser", method=RequestMethod.POST)
	public String selectUser(UserVo user,HttpSession session, Model model){
		UserVo result = new UserVo();
		result = service.selectUser(user);	
		if(result != null){
			session.setAttribute("userId", result.getUserId());
			return "todo";
		}else{
			model.addAttribute("message", "아이디가 존재하지 않습니다.");
			return "login";
		}
	}
	
	@RequestMapping(value="/moveCreate", method=RequestMethod.GET)
	public String moveCreate(){
		return "create";
	}
	
	
}
