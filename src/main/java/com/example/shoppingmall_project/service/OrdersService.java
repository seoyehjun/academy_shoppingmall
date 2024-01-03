package com.example.shoppingmall_project.service;

import com.example.shoppingmall_project.model.OrdersDAO;
import com.example.shoppingmall_project.model.vo.MembersVO;
import com.example.shoppingmall_project.model.vo.OrdersVO;
import jakarta.servlet.http.HttpSession;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import java.sql.SQLIntegrityConstraintViolationException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@Service
public class OrdersService {


    @Autowired
    private HttpSession httpSession;

    @Autowired
    private OrdersDAO dao;





    public int insertCart(String size_Product, String color, int products_idx, int quantity) {
        OrdersVO ordersVO = new OrdersVO();
        ordersVO.setSize_product(size_Product);
        ordersVO.setColor(color);
        ordersVO.setProducts_idx(products_idx);
        ordersVO.setQuantity(quantity);
        MembersVO memberVO = (MembersVO) httpSession.getAttribute("user");
        int membersIdx = memberVO.getMembers_idx();
        return dao.insertCart(quantity, products_idx, membersIdx, color, size_Product);
    }

    public int insertFavorites(OrdersVO ordersVO) throws SQLIntegrityConstraintViolationException {
        MembersVO memberVO = (MembersVO) httpSession.getAttribute("user");
        ordersVO.setMembers_idx(memberVO.getMembers_idx());
        return dao.insertFavorites(ordersVO);
    }

    public int insertOrders(String addr1, String addr2, String addr3, String phoneNumber,
                             String deliveryMessage, String membersNickname, String membersIdx, double totalPrice) {
        OrdersVO ordersVO = new OrdersVO();
        ordersVO.setOrdersRecipientName(membersNickname);
        ordersVO.setOrdersDeliveryMessage(deliveryMessage);
        ordersVO.setOrdersNumberAddress(addr1);
        ordersVO.setOrdersRecipientAddress(addr2);
        ordersVO.setOrdersDetailedAddress(addr3);
        ordersVO.setOrdersRecipientPhone(phoneNumber);
        ordersVO.setOrdersTotalPrice(totalPrice);
        ordersVO.setMembersIdx(Integer.parseInt(membersIdx));

        // 필요한 경우 ordersVO 객체의 다른 필드들을 설정합니다

        return dao.insertOrders(ordersVO);
    }


}