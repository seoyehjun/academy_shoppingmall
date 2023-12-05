package com.example.shoppingmall_project.model.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class MembersVO {
    private int members_idx, members_points,members_ssn;
    private String members_id, members_password, members_nickname, members_email, members_address,
            members_detailed_address, members_phone_number, members_name, members_withdawn;
    private Date members_join_date;

}