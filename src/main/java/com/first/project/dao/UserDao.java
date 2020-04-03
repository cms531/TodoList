package com.first.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.first.project.dto.UserVo;

@Repository
public class UserDao {

	@Autowired
	SqlSession session;
	
	public UserVo selectUser(UserVo user){
		UserVo result = new UserVo();
		UserMapper mapper = session.getMapper(UserMapper.class);
		try {
			result = mapper.selectUser(user);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	public int insertUser(UserVo user){
		int result = 0;
		UserMapper mapper = session.getMapper(UserMapper.class);
		try {
			result = mapper.insertUser(user);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	
}
