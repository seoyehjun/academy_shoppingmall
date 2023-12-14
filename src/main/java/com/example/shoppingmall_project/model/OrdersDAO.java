package com.example.shoppingmall_project.model;

import com.example.shoppingmall_project.model.vo.OrdersVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Repository
@Mapper
public interface OrdersDAO {
    @Insert(" INSERT INTO ORDERSD_DETAILS (QUANTITY, ORDERS_IDX, PRODUCTS_IDX, COLOR_IDX, SIZE_IDX) " +
            "    SELECT 1 AS QUANTITY, " +
            "           3 AS ORDERS_IDX, " +
            "           4 AS PRODUCTS_IDX, " +
            "           (SELECT COLOR_IDX FROM COLOR WHERE COLOR = #{color}), " +
            "           (SELECT SIZE_IDX FROM SIZE_TABLE WHERE SIZE_PRODUCT = #{size_product}) " +
            "    FROM DUAL")
    int insertOrders(OrdersVO ordersVO);
    

}