package com.example.shoppingmall_project.model;

import com.example.shoppingmall_project.model.vo.ProductVO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface adminDAO {

    int insert(ProductVO input);

    @Select("select * from PRODUCTS_IMG where PRODUCTS_IMG_IDX = #{idx}")
    String selectIdx();


    @Delete("delete from products where products_idx = #{productsIdx}")
    int product_delete(int productsIdx);

    @Update("update from")
    int product_update(int productsIdx);
}
