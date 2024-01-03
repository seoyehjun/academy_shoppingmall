package com.example.shoppingmall_project.model.vo;

import lombok.Data;


//            상품등록 VO
//        카테고리, 상품이름, 상품가격, 상품이름사이즈(다중), 상품색상이름(다중)
@Data
public class AdminAddProductVO {
    private String categories_name, products_name, size_product, color;
    private int products_price,categories_idx;


}
