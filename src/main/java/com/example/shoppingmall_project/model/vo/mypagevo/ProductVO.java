package com.example.shoppingmall_project.model.vo.mypagevo;

import java.util.Date;

public class ProductVO
{
    int products_idx;
    String products_name;
    String products_description;
    int products_price;
    Date products_registration_date;
    int products_stock;
    String products_is_deleted;

    public int getProducts_idx() {
        return products_idx;
    }

    public void setProducts_idx(int products_idx) {
        this.products_idx = products_idx;
    }

    public String getProducts_name() {
        return products_name;
    }

    public void setProducts_name(String products_name) {
        this.products_name = products_name;
    }

    public String getProducts_description() {
        return products_description;
    }

    public void setProducts_description(String products_description) {
        this.products_description = products_description;
    }

    public int getProducts_price() {
        return products_price;
    }

    public void setProducts_price(int products_price) {
        this.products_price = products_price;
    }

    public Date getProducts_registration_date() {
        return products_registration_date;
    }

    public void setProducts_registration_date(Date products_registration_date) {
        this.products_registration_date = products_registration_date;
    }

    public int getProducts_stock() {
        return products_stock;
    }

    public void setProducts_stock(int products_stock) {
        this.products_stock = products_stock;
    }

    public String getProducts_is_deleted() {
        return products_is_deleted;
    }

    public void setProducts_is_deleted(String products_is_deleted) {
        this.products_is_deleted = products_is_deleted;
    }
}
