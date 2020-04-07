package com.first.project.dao;

import java.util.ArrayList;

import com.first.project.dto.TodoVo;

public interface TodoMapper {
	public int insertTodo(TodoVo todo);
	public ArrayList<TodoVo> selectAllTodo();
	public int deleteTodo(TodoVo todo);
	public TodoVo selectOneTodo(TodoVo todo);
	public int updateTodo(TodoVo todo);
	public int deleteOneUserAllTodo(TodoVo todo);
	
}
