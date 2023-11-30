package com.example.shoppingmall_project.service;

import java.util.List;

import com.example.shoppingmall_project.model.membersDAO;
import com.example.shoppingmall_project.model.vo.MembersVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class MembersService {
	
	@Autowired
	membersDAO dao;

	public List<MembersVO> getMembersTables(){
		return dao.selectAll();
	}

	public int signUp(MembersVO input) {
		
		return dao.signUp(input);
	}


}
