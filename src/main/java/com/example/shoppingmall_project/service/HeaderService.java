package com.example.shoppingmall_project.service;

import com.example.shoppingmall_project.model.HeaderDAO;
import com.example.shoppingmall_project.model.vo.HeaderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
public class HeaderService {

    @Autowired private HeaderDAO dao;

    public List<HeaderVO> getOuter(int idx) {
        List<HeaderVO> list = dao.getOuter(idx);
        return list;
    }

    public void addCommonAttributes(Model model) {
        model.addAttribute("outer", getOuter(1));
        model.addAttribute("top", getOuter(2));
        model.addAttribute("bottom", getOuter(3));
        model.addAttribute("accessory", getOuter(4));
    }
}
