package com.example.shoppingmall_project.service;

import java.util.List;

import com.example.shoppingmall_project.model.SignUpDAO;
import com.example.shoppingmall_project.model.TestDAO;
import com.example.shoppingmall_project.model.vo.MembersVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class SignUpService {
	
	@Autowired
	SignUpDAO dao;

	public int signUp(MembersVO input) {

		return dao.signUp(input);
	}

	@Autowired
	TestDAO testDAO;

	public List<MembersVO> getMembersTables(){
		return testDAO.selectAll();
	}




}
