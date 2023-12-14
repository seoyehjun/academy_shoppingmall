package com.example.shoppingmall_project.model.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HeaderVO {
    private int categories_idx, parentcategoty_idx;
    private String categories_name;
}
