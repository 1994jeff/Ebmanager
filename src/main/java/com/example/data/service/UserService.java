package com.example.data.service;

import java.util.List;

import com.example.data.bean.RetParam;
import com.example.data.bean.User;

public interface UserService {

	List<User> getUserByCondition(User user) throws Exception;

	void updateUserByCondition(User user) throws Exception;

	void insertUser(User auser) throws Exception;

	void deleteUserByUserNo(String userNo)throws Exception;

}
