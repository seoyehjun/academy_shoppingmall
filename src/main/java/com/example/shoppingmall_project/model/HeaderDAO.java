package com.example.shoppingmall_project.model;

import com.example.shoppingmall_project.model.vo.HeaderVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface HeaderDAO {

    @Select("select categories_idx, categories_name from categories where parentcategory_idx = #{parentcategory_idx}")
    List<HeaderVO> getOuter(int idx);
}
