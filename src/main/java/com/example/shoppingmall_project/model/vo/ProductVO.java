package com.example.shoppingmall_project.model.vo;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class ProductVO {
    private int products_idx, products_price, products_stock, categories_idx;
    private int size_idx, color_idx;
    private String products_name, img_url, products_description;
    private Date products_registration_date;
    private String products_is_deleted, size_product, color, categories_name;

}
