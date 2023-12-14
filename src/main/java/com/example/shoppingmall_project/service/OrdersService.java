package com.example.shoppingmall_project.service;

import com.example.shoppingmall_project.model.OrdersDAO;
import com.example.shoppingmall_project.model.vo.OrdersVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrdersService {

    @Autowired
    private OrdersDAO dao;
    public int insertOrders(String size_Product, String color) {
        OrdersVO ordersVO = new OrdersVO();
        ordersVO.setSize_product(size_Product);
        ordersVO.setColor(color);
        return dao.insertOrders(ordersVO);
    }
}