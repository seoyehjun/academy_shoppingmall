package com.example.shoppingmall_project.model.vo;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

//        MEMBERS_IDX	NUMBER
//        MEMBERS_ID	VARCHAR2(30 BYTE)
//        MEMBERS_PASSWORD	VARCHAR2(50 BYTE)
//        MEMBERS_NICKNAME	VARCHAR2(100 BYTE)
//        MEMBERS_EMAIL	VARCHAR2(100 BYTE)
//        MEMBERS_ADDRESS	VARCHAR2(300 BYTE)
//        MEMBERS_DETAILED_ADDRESS	VARCHAR2(300 BYTE)
//        MEMBERS_PHONE_NUMBER	VARCHAR2(13 BYTE)
//        MEMBERS_NAME	VARCHAR2(50 BYTE)
//        MEMBERS_SSN	NUMBER
//        MEMBERS_IS_WITHDRAWN	VARCHAR2(1 BYTE)
//        MEMBERS_POINTS	NUMBER
//        MEMBERS_JOIN_DATE	DATE
@Getter
@Setter
public class MembersVO {
    private int members_idx, members_points,members_ssn;
    private String members_id, members_password, members_nickname, members_email, members_address,
            members_detailed_address, members_phone_number, members_name, members_withdawn;
    private Date members_join_date;

}
