package com.first.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.first.project.dto.TodoVo;

@Repository
public class TodoDao {

	@Autowired
	SqlSession session;
	
	public int insertTodo(TodoVo todo){
		int result = 0;
		TodoMapper mapper = session.getMapper(TodoMapper.class);
		try {
			result = mapper.insertTodo(todo);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public ArrayList<TodoVo> selectAllTodo(){
		ArrayList<TodoVo> result = new ArrayList<>();
		TodoMapper mapper = session.getMapper(TodoMapper.class);
		try {
			result = mapper.selectAllTodo();
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	public int deleteTodo(TodoVo todo){
		int result = 0;
		TodoMapper mapper = session.getMapper(TodoMapper.class);
		try {
			result = mapper.deleteTodo(todo);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	public TodoVo selectOneTodo(TodoVo todo){
		TodoVo result = new TodoVo();
		TodoMapper mapper = session.getMapper(TodoMapper.class);
		try {
			result = mapper.selectOneTodo(todo);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	public int updateTodo(TodoVo todo){
		int result = 0;
		TodoMapper mapper = session.getMapper(TodoMapper.class);
		try {
			result = mapper.updateTodo(todo);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	public int deleteOneUserAllTodo(TodoVo todo){
		int result = 0;
		TodoMapper mapper = session.getMapper(TodoMapper.class);
		try {
			result = mapper.deleteOneUserAllTodo(todo);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
}
