package com.example.shoppingmall_project.model;

import com.example.shoppingmall_project.model.vo.OrdersVO;
import com.example.shoppingmall_project.model.vo.mypagevo.O_P_OD_vo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
@Mapper
public interface OrdersDAO {
    @Insert(" INSERT INTO ORDERSD_DETAILS (QUANTITY, ORDERS_IDX, PRODUCTS_IDX, COLOR_IDX, SIZE_IDX) " +
            "    SELECT #{quantity} AS QUANTITY, " +
            "           3 AS ORDERS_IDX, " +
            "           #{products_idx} AS PRODUCTS_IDX, " +
            "           (SELECT COLOR_IDX FROM COLOR WHERE COLOR = #{color}), " +
            "           (SELECT SIZE_IDX FROM SIZE_TABLE WHERE SIZE_PRODUCT = #{size_product}) " +
            "    FROM DUAL")
    int insertOrders(OrdersVO ordersVO);




    @Insert(" INSERT INTO cart (QUANTITY, PRODUCTS_IDX, MEMBERS_IDX, COLOR_IDX, SIZE_IDX) " +
            "    SELECT #{quantity} AS QUANTITY, " +
            "           #{members_idx} AS MEMBERS_IDX, " +
            "           #{products_idx} AS PRODUCTS_IDX, " +
            "           (SELECT COLOR_IDX FROM COLOR WHERE COLOR = #{color}), " +
            "           (SELECT SIZE_IDX FROM SIZE_TABLE WHERE SIZE_PRODUCT = #{size_product}) " +
            "    FROM DUAL")
    int insertCart(OrdersVO ordersVO, int members_idx, String size_product, String color, int products_idx, int quantity);



   @Insert("insert into favorites (products_idx, members_idx, color_idx, size_idx) " +
           "        select #{products_idx} as PRODUCTS_IDX, " +
           "               #{members_idx} as MEMBERS_IDX, " +
           "               (SELECT color_idx FROM color WHERE color = #{color}), " +
           "               (SELECT size_idx FROM size_table WHERE size_product = #{size_product}) " +
           " FROM dual")
    int insertFavorites(OrdersVO ordersVO);
}