package com.first.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.first.project.dto.TodoVo;
import com.first.project.service.AllService;

@Controller
public class TodoController {

	@Autowired
	AllService service;
	
	@RequestMapping(value="/moveWrite", method=RequestMethod.GET)
	public String moveWrite(){
		return "write";
	}
	
	@RequestMapping(value="/insertTodo", method=RequestMethod.POST)
	public String insertTodo(TodoVo todo, HttpSession session){
		int result = 0;
		String temp = (String) session.getAttribute("userId");
		todo.setUserId(temp);
		System.out.println(todo);
		result = service.insertTodo(todo);
		if(result != 0){
			return "redirect:/todoPage";
		}
		return "write";
	}
	
	@RequestMapping(value="/todoPage", method=RequestMethod.GET)
	public String todoPage(){
		return "todo";
	}
	
	
	@RequestMapping(value="/selectAllTodo", method=RequestMethod.GET)
	@ResponseBody
	public ArrayList<TodoVo> selectAllTodo(){
		ArrayList<TodoVo> result = new ArrayList<>();
		result = service.selectAllTodo();
		return result;
	}
	
	
	@RequestMapping(value="/deleteTodo", method=RequestMethod.POST)
	@ResponseBody
	public String deleteTodo(TodoVo todo){
		int result = 0; 
		result = service.deleteTodo(todo);
		if(result != 0){
			return "success";
		}else{
			return "fail";
		}
	}
	
}
