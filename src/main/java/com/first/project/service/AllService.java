package com.first.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.first.project.dao.TodoDao;
import com.first.project.dao.UserDao;
import com.first.project.dto.TodoVo;
import com.first.project.dto.UserVo;

@Service
public class AllService {

	@Autowired
	UserDao uDao;
	
	@Autowired
	TodoDao tDao;
	
	public UserVo selectUser(UserVo user){
		return uDao.selectUser(user);
	}
	
	public int insertUser(UserVo user){
		return uDao.insertUser(user);
	}
	
	public int insertTodo(TodoVo todo){
		return tDao.insertTodo(todo);
	}
	
	public ArrayList<TodoVo> selectAllTodo(){
		return tDao.selectAllTodo();
	}
	
	public int deleteTodo(TodoVo todo){
		return tDao.deleteTodo(todo);
	}
	
}
