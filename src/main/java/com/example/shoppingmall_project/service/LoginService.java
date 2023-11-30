package com.example.shoppingmall_project.service;

import com.example.shoppingmall_project.model.MembersDAO;
import com.example.shoppingmall_project.model.vo.MembersVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    @Autowired private MembersDAO dao;

    public MembersVO getLogin(MembersVO input) {
        return dao.selectOne(input);
    }
}
