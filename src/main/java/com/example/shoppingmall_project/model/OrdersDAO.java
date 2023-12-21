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
            "    SELECT 1 AS QUANTITY, " +
            "           3 AS ORDERS_IDX, " +
            "           4 AS PRODUCTS_IDX, " +
            "           (SELECT COLOR_IDX FROM COLOR WHERE COLOR = #{color}), " +
            "           (SELECT SIZE_IDX FROM SIZE_TABLE WHERE SIZE_PRODUCT = #{size_product}) " +
            "    FROM DUAL")
    int insertOrders(OrdersVO ordersVO);


    @Select("select o.orders_idx, o.orders_date, p.products_name ,o.orders_status , od.quantity, m.members_id from orders o, products p, ordersd_details od, members m where od.orders_idx = o.orders_idx and od.products_idx = p.products_idx order by o.orders_date desc")
    List<O_P_OD_vo> adminlist();
}