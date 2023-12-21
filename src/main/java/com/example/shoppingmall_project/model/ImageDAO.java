package com.example.shoppingmall_project.model;

import com.example.shoppingmall_project.model.vo.ProductVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ImageDAO {

    @Select("select img_url from products_img")
    List<String> getAllImageNames();

//    @Select("SELECT " +
//            "products.products_idx, " +
//            "MAX(products.products_name) AS products_name, " +
//            "MAX(products.products_description) AS products_description, " +
//            "LISTAGG(products_img.img_url, ',') WITHIN GROUP (ORDER BY products_img.img_url) AS img_urls, " +
//            "MAX(categories.parentcategory_idx) AS parentcategory_idx " +
//            "FROM products " +
//            "JOIN categories ON products.categories_idx = categories.categories_idx " +
//            "JOIN products_img ON products.products_idx = products_img.products_idx " +
//            "WHERE categories.parentcategory_idx = #{parentcategory_idx} " +
//            "GROUP BY products.products_idx")
//    ProductVO getMenuImageNames(int idx);
}
