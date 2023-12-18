package com.example.shoppingmall_project.model;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ImageDAO {

    @Select("select img_url from products_img")
    List<String> getAllImageNames();
}
