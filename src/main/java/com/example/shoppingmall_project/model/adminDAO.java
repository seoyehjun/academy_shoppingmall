package com.example.shoppingmall_project.model;

import com.example.shoppingmall_project.model.vo.*;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface adminDAO {

    int insert(ProductVO input);

    @Select("select * from PRODUCTS_IMG where PRODUCTS_IMG_IDX = #{idx}")
    String selectIdx();


    @Delete("delete from products where products_idx = #{productsIdx}")
    void product_delete(int productsIdx);

    @Delete("delete from products_color where products_idx = #{productsIdx}")
    void product_delete_color(int productsIdx);

    @Delete("delete from products_size where products_idx = #{productsIdx}")
    void product_delete_size(int productsIdx);

    @Update("update products set products_name = #{products_name}," +
            "products_price = #{products_price}, " +
            "products_stock = #{products_stock}" +
            " where products_idx = #{products_idx} ")
    int product_update(ProductVO input);

    @Select("select * from products where products_idx = #{products_idx}")
    ProductVO selectOne(int products_Idx);

    @Select("SELECT " +
            "od.ordersd_details, " +
            "o.orders_idx, " +
            "o.orders_date, " +
            "m.members_name, " +
            "m.members_id, " +
            "p.products_name, " +
            "c.color, " +
            "s.size_product, " +
            "p.products_price, " +
            "o.orders_status " +
            "FROM " +
            "ordersd_details od " +
            "JOIN orders o ON od.orders_idx = o.orders_idx " +
            "JOIN members m ON o.members_idx = m.members_idx " +
            "JOIN products p ON od.products_idx = p.products_idx " +
            "JOIN color c ON od.color_idx = c.color_idx " +
            "JOIN size_table s ON od.size_idx = s.size_idx")
    List<AdminOrdersVO> orderSelectAll();

    @Select("SELECT " +
            "m.members_id, " +
            "m.members_name, " +
            "o.orders_date, " +
            "o.orders_idx, " +
            "o.orders_status, " +
            "p.products_name, " +
            "p.products_price, " +
            "c.color, " +
            "s.size_product " +
            "FROM orders o " +
            "INNER JOIN members m ON o.members_idx = m.members_idx " +
            "INNER JOIN ordersd_details od ON o.orders_idx = od.orders_idx " +
            "INNER JOIN products p ON od.products_idx = p.products_idx " +
            "INNER JOIN products_color pc ON od.products_idx = pc.products_idx AND od.color_idx = pc.color_idx " +
            "INNER JOIN color c ON pc.color_idx = c.color_idx " +
            "INNER JOIN products_size ps ON od.products_idx = ps.products_idx AND od.size_idx = ps.size_idx " +
            "INNER JOIN size_table s ON ps.size_idx = s.size_idx " +
            "WHERE o.orders_idx = #{orders_idx}")
    AdminOrdersVO orderSelectOne(int orders_idx);

    @Update("update orders set orders_status = #{orders_status}" +
            " where orders_idx = #{orders_idx} ")
    int order_update(AdminOrdersVO input);

    @Select("SELECT categories_idx, categories_name, parentcategory_idx " +
            "FROM categories " +
            "WHERE parentcategory_idx IS NOT NULL")
    List<CategoriesVO> categoriesAll();

    @Insert("INSERT INTO products (products_name, products_price, products_stock, categories_idx) " +
            "VALUES (#{products_name}, #{products_price}, #{products_stock}, #{categories_idx})")
    @SelectKey(statement = "select product_sequence.CURRVAL FROM DUAL", keyProperty="products_idx", before = false, resultType=int.class)
    void insertProduct(AddProductVO productInfo);
    //    @Options(useGeneratedKeys = true, keyProperty = "products_idx")
//    mysql에서는 사용 가능 왜냐 해당 열에 auto increment 로 자동 증가를 하는데
//    오라클에서는 시퀀스로만 증가 시키기 때문에 시퀀스를 등록 해야 mybatis에서는 사용이 가능하다 밑에는 오라클 용
//    select product_sequence.CURRVAL 로 현재 시퀀스를 가져와야지 이상이 없다.

    @Select("select size_idx, size_product from size_table order by size_idx asc")
    List<SizeVO> sizeAll();


    @Insert("INSERT INTO products_size (products_idx, size_idx) VALUES (#{products_idx}, #{size_idx})")
    void insertProductSize(@Param("products_idx") int products_idx, @Param("size_idx") Integer size_idx);

    @Select("select color_idx, color from color order by color_idx asc")
    List<ColorVO> colorAll();

    @Insert("insert into products_color (products_idx, color_idx) values (#{products_idx}, #{color_idx})")
    void insertProductColor(@Param("products_idx") int products_idx, @Param("color_idx") Integer color_idx);

    @Insert("insert into products_img (products_idx, img_url) values (#{products_idx}, #{fileName})")
    void insertProductImg(int products_idx, String fileName);
}
