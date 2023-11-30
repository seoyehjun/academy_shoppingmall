package com.example.shoppingmall_project.model;

import com.example.shoppingmall_project.model.vo.MembersVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface SignUpDAO {

    @Insert("INSERT INTO members (members_id, members_password, members_nickname, members_email, members_address, members_detailed_address, members_phone_number, members_name, members_ssn) " +
            "VALUES (#{members_id}, #{members_password }, #{members_nickname }, #{members_email }, #{members_address }, #{members_detailed_address }, #{members_phone_number }, #{members_name }, #{members_ssn })")
    int signUp(MembersVO input);

}
