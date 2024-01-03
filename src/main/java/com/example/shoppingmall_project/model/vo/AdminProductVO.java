package com.example.shoppingmall_project.model.vo;

import lombok.Data;

@Data
public class AdminProductVO {
    private int products_idx, categories_idx, products_price, products_stock;
    private String products_name;

}
