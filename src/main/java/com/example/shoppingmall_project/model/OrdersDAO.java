package com.example.shoppingmall_project.model;

import com.example.shoppingmall_project.model.vo.OrdersVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


@Repository
@Mapper
public interface OrdersDAO {

    @Insert(" INSERT INTO cart (QUANTITY,  MEMBERS_IDX, PRODUCTS_IDX, COLOR_IDX, SIZE_IDX) " +
            "    SELECT #{quantity} AS QUANTITY, " +
            "           #{members_idx} AS MEMBERS_IDX, " +
            "           #{products_idx} AS PRODUCTS_IDX, " +
            "           (SELECT COLOR_IDX FROM COLOR WHERE COLOR = #{color}), " +
            "           (SELECT SIZE_IDX FROM SIZE_TABLE WHERE SIZE_PRODUCT = #{size_product}) " +
            "    FROM DUAL")
    int insertCart(@Param("quantity") int quantity, @Param("products_idx") int productsIdx,
                   @Param("members_idx") int members_idx, @Param("color") String color,
                   @Param("size_product") String size_Product);


    @Insert("insert into favorites (products_idx, members_idx, color_idx, size_idx) " +
            "        select #{products_idx} as PRODUCTS_IDX, " +
            "               #{members_idx} as MEMBERS_IDX, " +
           "               (SELECT color_idx FROM color WHERE color = #{color}), " +
           "               (SELECT size_idx FROM size_table WHERE size_product = #{size_product}) " +
           " FROM dual")
    int insertFavorites(OrdersVO ordersVO);


    @Insert("INSERT INTO orders (orders_recipient_name, orders_address_number, orders_address, orders_detailed_address, orders_recipient_phone, " +
            "orders_delivery_notes, orders_total_price, members_idx) " +
            "VALUES (#{ordersVO.ordersRecipientName}, #{ordersVO.ordersNumberAddress}, #{ordersVO.ordersRecipientAddress}, #{ordersVO.ordersDetailedAddress}, " +
            "#{ordersVO.ordersRecipientPhone}, #{ordersVO.ordersDeliveryMessage}, #{ordersVO.ordersTotalPrice}, #{ordersVO.membersIdx})")
    int insertOrders(@Param("ordersVO") OrdersVO ordersVO);
}