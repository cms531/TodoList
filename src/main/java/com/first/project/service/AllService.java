package com.first.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.first.project.dao.UserDao;
import com.first.project.dto.UserVo;

@Service
public class AllService {

	@Autowired
	UserDao uDao;
	
	public UserVo selectUser(UserVo user){
		return uDao.selectUser(user);
	}
	
	public int insertUser(UserVo user){
		return uDao.insertUser(user);
	}
	
}
