package com.example.shoppingmall_project.model.vo;

import lombok.Data;

@Data
public class CategoriesVO {
    private int categories_idx, parentcategory_idx;
    private String categories_name;
}
