package com.example.shoppingmall_project.model.vo.mypagevo;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class JInquiries_VO
{
    private int inquiries_idx, products_idx, members_idx;
    private String inquiries_title, inquiries_content, inquiries_image_url;
    private String inquiries_category;
    private Date inquiries_registration_date;
    private int members_points, members_ssn;
    private String members_id, members_password, members_nickname, members_email, members_address,
            members_detailed_address, members_phone_number, members_name, members_withdawn;
    private java.util.Date members_join_date;

}
