package com.example.shoppingmall_project.model.vo;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Date;

@Data
public class ProductVO {
    private int products_idx, products_price, products_stock, categories_idx;
    private int size_idx, color_idx, quantity;
    private String products_name, img_url, products_description, banner_img_url;
    private Date products_registration_date;
    private String products_is_deleted, size_product, color, categories_name;

    private MultipartFile upload;
}
