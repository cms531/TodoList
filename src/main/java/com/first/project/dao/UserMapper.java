package com.first.project.dao;

import com.first.project.dto.UserVo;

public interface UserMapper {
	public UserVo selectUser(UserVo user);
	public int insertUser(UserVo user);
	public int updateUser(UserVo user);
	public int deleteUser(UserVo user);
	
}
