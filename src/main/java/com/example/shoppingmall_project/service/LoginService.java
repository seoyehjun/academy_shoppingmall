package com.example.shoppingmall_project.service;

import com.example.shoppingmall_project.model.LoginDAO;
import com.example.shoppingmall_project.model.vo.MembersVO;
import com.example.shoppingmall_project.model.vo.AdminsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    @Autowired private LoginDAO dao;

    public MembersVO getLogin(MembersVO input) {
        return dao.selectOne(input);
    }
}
