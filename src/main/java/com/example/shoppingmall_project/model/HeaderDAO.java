package com.example.shoppingmall_project.model;

import com.example.shoppingmall_project.model.vo.HeaderVO;
import com.example.shoppingmall_project.model.vo.ProductVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface HeaderDAO {

    @Select("select categories_idx, categories_name from categories where parentcategory_idx = #{parentcategory_idx}")
    List<HeaderVO> getOuter(int idx);

    @Select("select img_url, products_idx from products_img order by products_idx, img_url")
    List<ProductVO> getImg();

    @Select("select products_idx from products where products_idx = #{products_idx}")
    int getIdx(int idx);

    @Select("select p.products_idx, p.products_name, p.products_price, " +
            "c.categories_name, c.parentcategory_idx " +
            "from products p " +
            "join categories c on p.categories_idx = c.categories_idx " +
            "where c.categories_idx = #{idx} " +
            "order by p.products_idx desc")
    List<ProductVO> selectSubMenu(int idx);
}
