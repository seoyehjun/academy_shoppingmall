package com.example.shoppingmall_project.model.vo;

import lombok.Data;

import java.sql.Date;

@Data
public class AdminOrdersVO {
    private int orders_idx, products_price, ordersd_details;
    private String members_id, members_name, products_name, color, size_product, orders_status;
    private Date orders_date;

}
