package com.example.shoppingmall_project.service;

import com.example.shoppingmall_project.model.FindDAO;
import com.example.shoppingmall_project.model.vo.MembersVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FindService {

    @Autowired private FindDAO dao;

    public String findID(String members_email) {
        List<String> ids = dao.findID(members_email);
        String result = "존재하지 않는 계정 정보";

        for (String id : ids) {
            result = "회원님의 아이디는 " + id + " 입니다";
        }

        return result;
    }

    public String findPW(MembersVO input) {
        input = dao.findUser(input);
        String msg = "존재하지 않는 계정 정보";

        if (input == null) {
            return msg;
        }

        msg = "회원님의 비밀번호는 " + input.getMembers_password() + " 입니다";

        return msg;
    }

}