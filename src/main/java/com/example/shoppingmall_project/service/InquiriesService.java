package com.example.shoppingmall_project.service;

import com.example.shoppingmall_project.model.InquiriesDAO;
import com.example.shoppingmall_project.model.vo.InquiriesVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Service
@RequestMapping
public class InquiriesService {

    @Autowired
    private InquiriesDAO dao;

    public List<InquiriesVO> getInquiries() {
        return dao.selectAll();
    }

    public int writeinquiries(InquiriesVO input) {
        return dao.insertInquiries(input);
    }

}
