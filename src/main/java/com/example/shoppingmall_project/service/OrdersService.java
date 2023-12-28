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

@Service
public class OrdersService {


    @Autowired
    private HttpSession httpSession;

    @Autowired
    private OrdersDAO dao;

    public int insertOrders(String size_Product, String color, int products_idx, int quantity) {
        // 실제로 데이터베이스에 값을 추가하도록 구현 (dao나 repository를 사용하여 DB에 접근)
        // ...

        // 임의의 성공 여부를 반환 (성공 시 1, 실패 시 0 등)
        return 1;
    }

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



//    public int insertOrder(String addr2, String addr3, String phoneNumber, String email,
//                           String deliveryMessage, double totalPrice) {
//
//        return 0; // 실패 시 0 반환
//    }
}