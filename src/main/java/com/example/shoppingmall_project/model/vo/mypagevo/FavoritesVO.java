package com.example.shoppingmall_project.model.vo.mypagevo;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FavoritesVO
{
    int favorites_idx, products_idx, members_idx;
    int color_idx, size_idx,products_price ;

    String products_name, color, img_url, size_product;
}
