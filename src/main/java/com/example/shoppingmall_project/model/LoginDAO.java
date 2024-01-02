package com.example.shoppingmall_project.model;

import com.example.shoppingmall_project.model.vo.MembersVO;
import com.example.shoppingmall_project.model.vo.AdminsVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface LoginDAO {
    @Select("select * from members " +
            "where members_id = #{members_id} " +
            "and members_password = #{members_password}")
    MembersVO selectOne(MembersVO input);

}

