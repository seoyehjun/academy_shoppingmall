package com.example.shoppingmall_project;

import com.example.shoppingmall_project.model.HeaderDAO;
import com.example.shoppingmall_project.model.MainDAO;
import com.example.shoppingmall_project.model.vo.HeaderVO;
import com.example.shoppingmall_project.model.vo.ImageVO;
import com.example.shoppingmall_project.service.HeaderService;
import com.example.shoppingmall_project.service.MainService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class ShoppingmallProjectApplicationTests {

    @Test
    void contextLoads() {
    }

    @Autowired private MainDAO dao;
    @Autowired private MainService ms;
    @Test
    public void getImg(){
        List<ImageVO> list = ms.getBanner();
        Assertions.assertNotNull(list, "list should not be null");
    }

    @Autowired private HeaderDAO hdao;
    @Autowired private HeaderService hs;

    @Test
    public void getOuter(){
        List<HeaderVO> list = hs.getOuter();
        Assertions.assertNotNull(list, "list should not be null");
    }
}
