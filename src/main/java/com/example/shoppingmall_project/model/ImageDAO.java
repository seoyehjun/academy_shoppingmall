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

    @Select("SELECT DISTINCT " +
            "products.*, products_img.img_url, categories.parentcategory_idx " +
            "FROM products " +
            "JOIN categories ON products.categories_idx = categories.categories_idx " +
            "JOIN products_img ON products.products_idx = products_img.products_idx " +
            "WHERE categories.parentcategory_idx = #{categories.parentcategory_idx}")
    ProductVO getMenuImageNames(int idx);
}
