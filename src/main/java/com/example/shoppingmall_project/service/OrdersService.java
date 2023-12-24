package com.example.shoppingmall_project.service;

import com.example.shoppingmall_project.model.OrdersDAO;
import com.example.shoppingmall_project.model.vo.OrdersVO;
import com.example.shoppingmall_project.model.vo.mypagevo.O_P_OD_vo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrdersService {

    @Autowired
    private OrdersDAO dao;
    public int insertOrders(String size_Product, String color, int products_idx) {
        OrdersVO ordersVO = new OrdersVO();
        ordersVO.setSize_product(size_Product);
        ordersVO.setColor(color);
        ordersVO.setProducts_idx(products_idx);
        return dao.insertOrders(ordersVO);
    }

    public int insertCart(String size_Product, String color, int products_idx) {
        OrdersVO ordersVO = new OrdersVO();
        ordersVO.setSize_product(size_Product);
        ordersVO.setColor(color);
        ordersVO.setProducts_idx(products_idx);
        return dao.insertCart(ordersVO);
    }

    public int insertFavorites(int products_idx) {
        OrdersVO ordersVO = new OrdersVO();
        ordersVO.setProducts_idx(products_idx);
        return dao.insertFavorites(ordersVO);
    }
}