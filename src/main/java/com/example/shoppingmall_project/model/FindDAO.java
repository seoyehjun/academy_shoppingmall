package com.example.shoppingmall_project.model;

import com.example.shoppingmall_project.model.vo.MembersVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface FindDAO {
    @Select("select members_id from members " +
            "where members_email = #{members_email}")
    List<String> findID(String members_email);

    @Select("select * from members " +
            "where members_id = #{members_id} " +
            "and members_email = #{members_email}")
    MembersVO findUser(MembersVO input);
}
