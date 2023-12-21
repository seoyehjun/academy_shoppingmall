package com.example.shoppingmall_project.model.vo;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;


@Getter
@Setter
public class InquiriesVO {
    private int inquiries_idx, products_idx, members_idx;
    private String inquiries_title, inquiries_content, inquiries_image_url;
    private String inquiries_category;
    private Date inquiries_resistration_date;

}