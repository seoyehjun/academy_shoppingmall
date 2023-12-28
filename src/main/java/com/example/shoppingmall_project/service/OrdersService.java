package com.example.shoppingmall_project.service;

import com.example.shoppingmall_project.model.OrdersDAO;
import com.example.shoppingmall_project.model.vo.MembersVO;
import com.example.shoppingmall_project.model.vo.OrdersVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLIntegrityConstraintViolationException;

@Service
public class OrdersService {



    @Autowired
    private HttpSession httpSession;

    @Autowired
    private OrdersDAO dao;
    public int insertOrders(String size_Product, String color, int products_idx, int quantity) {
        OrdersVO ordersVO = new OrdersVO();
        ordersVO.setSize_product(size_Product);
        ordersVO.setColor(color);
        ordersVO.setProducts_idx(products_idx);
        ordersVO.setQuantity(quantity);
        return dao.insertOrders(ordersVO);
    }

    public int insertCart(String size_Product, String color, int products_idx, int quantity) {
        OrdersVO ordersVO = new OrdersVO();
        ordersVO.setSize_product(size_Product);
        ordersVO.setColor(color);
        ordersVO.setProducts_idx(products_idx);
        ordersVO.setQuantity(quantity);
        MembersVO memberVO = (MembersVO) httpSession.getAttribute("user");
        int members_idx = memberVO.getMembers_idx();
        return dao.insertCart(ordersVO, members_idx, ordersVO.getSize_product(),
                ordersVO.getColor(), ordersVO.getProducts_idx(), ordersVO.getQuantity());
    }

    public int insertFavorites(OrdersVO ordersVO) throws SQLIntegrityConstraintViolationException {
        MembersVO memberVO = (MembersVO) httpSession.getAttribute("user");
        ordersVO.setMembers_idx(memberVO.getMembers_idx());
        return dao.insertFavorites(ordersVO);
    }
}