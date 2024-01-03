package com.example.shoppingmall_project.model.vo;

import lombok.Data;

import java.sql.Date;

@Data
public class AddProductVO {
    private int products_price, products_stock, categories_idx;
    private String products_name,categories_name;

    private int products_idx;

    public AddProductVO(int categories_idx, String products_name, int products_price, int products_stock) {
        this.categories_idx = categories_idx;
        this.products_name = products_name;
        this.products_price = products_price;
        this.products_stock = products_stock;
    }
}
