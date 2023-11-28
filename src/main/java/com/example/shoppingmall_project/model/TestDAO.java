package com.example.shoppingmall_project.model;


import com.example.shoppingmall_project.model.vo.MembersVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface TestDAO {

    // 테스틍용 DAO
    @Select("select * from members order by members_idx  asc")
    List<MembersVO> selectAll();

}
