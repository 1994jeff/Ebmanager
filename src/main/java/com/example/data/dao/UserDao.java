package com.example.data.dao;

import java.util.List;

import com.example.data.bean.RetParam;
import com.example.data.bean.User;

public interface UserDao {

	List<User> getUserByCondition(User user);

	void updateUserByCondition(User user);

	void insertUser(User auser);

	void deleteUserByUserNo(String userNo);

}
