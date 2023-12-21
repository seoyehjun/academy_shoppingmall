package com.example.shoppingmall_project.model.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrdersVO {
    private int ordersd_details, quantity, orders_idx;
    private int products_idx, color_idx, size_idx;
    private String color;
    private String size_product;
    private String members_idx;
}
