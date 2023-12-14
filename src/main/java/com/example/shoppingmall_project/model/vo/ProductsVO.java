package com.example.shoppingmall_project.model.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/*
PRODUCTS_IDX               NOT NULL NUMBER
PRODUCTS_NAME              NOT NULL VARCHAR2(300)
PRODUCTS_IMAGE_URL         NOT NULL VARCHAR2(500)
PRODUCTS_DESCRIPTION       NOT NULL VARCHAR2(500)
PRODUCTS_PRICE             NOT NULL NUMBER
PRODUCTS_REGISTRATION_DATE NOT NULL DATE
PRODUCTS_STOCK             NOT NULL NUMBER
PRODUCTS_IS_DELETED                 VARCHAR2(1)
CATEGORIES_IDX             NOT NULL NUMBER

 */
@Setter
@Getter
public class ProductsVO {
    private int products_idx, products_price, products_stock, categories_idx;
    private String products_name, img_url, products_description, products_is_delete;
    private Date products_registartion_date;
}
