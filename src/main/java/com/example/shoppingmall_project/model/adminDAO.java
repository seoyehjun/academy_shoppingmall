package com.example.shoppingmall_project.model;

import com.example.shoppingmall_project.model.vo.AdminOrdersVO;
import com.example.shoppingmall_project.model.vo.ProductVO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface adminDAO {

    int insert(ProductVO input);

    @Select("select * from PRODUCTS_IMG where PRODUCTS_IMG_IDX = #{idx}")
    String selectIdx();


    @Delete("delete from products where products_idx = #{productsIdx}")
    int product_delete(int productsIdx);

    @Update("update products set products_name = #{products_name}," +
            "products_price = #{products_price}," +
            "products_description = #{products_description}" +
            " where products_idx = #{products_idx} ")
    int product_update(ProductVO input);

    @Select("select * from products where products_idx = #{products_idx}")
    ProductVO selectOne(int products_Idx);

    @Select("SELECT " +
            "m.members_id, " +
            "m.members_name, " +
            "o.orders_date, " +
            "o.orders_idx, " +
            "o.ORDERS_STATUS, " +
            "p.products_name, " +
            "p.products_price, " +
            "c.color, " +
            "s.size_product " +
            "FROM orders o " +
            "INNER JOIN members m ON o.members_idx = m.members_idx " +
            "INNER JOIN ordersd_details od ON o.orders_idx = od.orders_idx " +
            "INNER JOIN products p ON od.products_idx = p.products_idx " +
            "INNER JOIN products_color pc ON p.products_idx = pc.products_idx " +
            "INNER JOIN color c ON pc.color_idx = c.color_idx " +
            "INNER JOIN products_size ps ON p.products_idx = ps.products_idx " +
            "INNER JOIN size_table s ON ps.size_idx = s.size_idx")
    List<AdminOrdersVO> orderSelectAll();

    @Select("SELECT " +
            "m.members_id, " +
            "m.members_name, " +
            "o.orders_date, " +
            "o.orders_idx, " +
            "o.ORDERS_STATUS, " +
            "p.products_name, " +
            "p.products_price, " +
            "c.color, " +
            "s.size_product " +
            "FROM orders o " +
            "INNER JOIN members m ON o.members_idx = m.members_idx " +
            "INNER JOIN ordersd_details od ON o.orders_idx = od.orders_idx " +
            "INNER JOIN products p ON od.products_idx = p.products_idx " +
            "INNER JOIN products_color pc ON p.products_idx = pc.products_idx " +
            "INNER JOIN color c ON pc.color_idx = c.color_idx " +
            "INNER JOIN products_size ps ON p.products_idx = ps.products_idx " +
            "INNER JOIN size_table s ON ps.size_idx = s.size_idx " +
            "where o.orders_idx = #{orders_idx} ")
    AdminOrdersVO orderSelectOne(int orders_idx);

    @Update("update orders set orders_status = #{orders_status}" +
            " where orders_idx = #{orders_idx} ")
    int order_update(AdminOrdersVO input);
}
