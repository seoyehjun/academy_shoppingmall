/*package com.example.shoppingmall_project.service;

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

	@Autowired
	TestDAO testDAO;

	public List<MembersVO> getMembersTables(){
		return testDAO.selectAll();
	}

	public int signUp(MembersVO input) {
		
		return dao.signUp(input);
	}


}

 */
//에러때문에 주석처리
