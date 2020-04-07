package com.first.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.first.project.dto.TodoVo;
import com.first.project.dto.UserVo;
import com.first.project.service.AllService;

@Controller
public class UserController {

	@Autowired
	AllService service;
	
	@RequestMapping(value="/loginUser", method=RequestMethod.POST)
	public String selectUser(UserVo user,HttpSession session,Model model){
		UserVo result = new UserVo();
		result = service.selectUser(user);	
		if(result != null){
			session.setAttribute("userId", result.getUserId());
			session.setAttribute("userName", result.getUserName());
			return "todo";
		}else{
			model.addAttribute("message", "로그인실패.");
			return "login";
		}
	}
	
	@RequestMapping(value="/moveCreate", method=RequestMethod.GET)
	public String moveCreate(){
		return "create";
	}
	
	@RequestMapping(value="/createAccount", method=RequestMethod.POST)
	public String insertUser(UserVo user){
		int result = 0;
		result = service.insertUser(user);
		if(result != 0){
			return "redirect:/moveLogin";
		}else{
			return "redirect:/moveCreate";
		}
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session){
		session.removeAttribute("userId");
		return "redirect:/moveLogin";
	}
	
	@RequestMapping(value="/moveLogin", method=RequestMethod.GET)
	public String moveLogin(){
		return "login";
	}
	
	@RequestMapping(value="/checkUserId",method=RequestMethod.GET)
	@ResponseBody
	public String checkUserId(UserVo user){
		UserVo result = new UserVo();
		result = service.selectUser(user);
		if(result == null){
			return "success";
		}else{
			return "fail";
		}
	}
	
	@RequestMapping(value="/moveSearch", method=RequestMethod.GET)
	public String moveSearch(){
		return "search";
	}
	
	@RequestMapping(value="/searchUser", method=RequestMethod.POST)
	@ResponseBody
	public UserVo searchUser(UserVo user){
		UserVo result = new UserVo();
		result = service.selectUser(user);
		return result;
	}
	
	@RequestMapping(value="/updatePw", method=RequestMethod.POST)
	public String updatePw(UserVo user,Model model){
		int result = 0;
		result = service.updateUser(user);
		if(result != 0){
			model.addAttribute("message", "비밀번호 변경에 성공하셨습니다.");
		}
		return "login";
		
	}
	
	@RequestMapping(value="/moveDeleteUser", method=RequestMethod.GET)
	public String moveDeleteUser(){
		return "deleteUser";
	}
	
	
	@RequestMapping(value="/deletePageSelectUser", method=RequestMethod.POST)
	@ResponseBody
	public String deletePageSelectUser(UserVo user,HttpSession session){
		UserVo result = new UserVo();
		user.setUserId((String)session.getAttribute("userId"));
		result = service.selectUser(user);
		if(result != null){
			return "success";
		}else{
			return "fail";
		}
	}
	
	
	@RequestMapping(value="/deleteUser", method=RequestMethod.POST)
	@ResponseBody
	public String deleteUser(HttpSession session){
		int result = 0;
		UserVo user = new UserVo();
		TodoVo todo = new TodoVo();
		
		user.setUserId((String)session.getAttribute("userId"));
		todo.setUserId((String)session.getAttribute("userId"));
		service.deleteOneUserAllTodo(todo);
		
		result = service.deleteUser(user);
		if(result != 0){
			return "success";
		}else{
			return "fail";
		}
		
	}
	
	
}
