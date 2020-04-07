package com.first.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String moveWrite(Model model){ 
		model.addAttribute("todo_seq",-1);
		model.addAttribute("check",false);
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
			return "redirect:/moveTodo";
		}
		return "write";
	}
	
	@RequestMapping(value="/moveTodo", method=RequestMethod.GET)
	public String moveTodo(){
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
	
	@RequestMapping(value="/readTodo", method=RequestMethod.GET)
	public String readTodo(TodoVo todo, Model model, HttpSession session){
		model.addAttribute("todo_seq", todo.getTodo_seq());
		model.addAttribute("userId",todo.getUserId());
		if(session.getAttribute("userId").equals(todo.getUserId())){
			model.addAttribute("check", "true");
		}else{
			model.addAttribute("check", "false");
		}
		return "write";
	}
	
	@RequestMapping(value="/selectOneTodo", method=RequestMethod.GET)
	@ResponseBody
	public TodoVo selectOneTodo(TodoVo todo){
		TodoVo result = new TodoVo();
		result = service.selectOneTodo(todo);
		return result;
	}
	
	@RequestMapping(value="/updateTodo", method=RequestMethod.POST)
	@ResponseBody
	public String updateTodo(TodoVo todo){
		int result = 0; 
		result = service.updateTodo(todo);
		if(result != 0){
			return "success";
		}else{
			return "fail";
		}
	}
	
	
	
}
