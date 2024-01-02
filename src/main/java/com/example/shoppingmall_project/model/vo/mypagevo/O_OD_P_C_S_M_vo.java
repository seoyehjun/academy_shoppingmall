package com.example.shoppingmall_project.model.vo.mypagevo;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class O_OD_P_C_S_M_vo 
{
	//Orders
	private String orders_status;
	private String orders_address;
	private String orders_detailed_address;
	private String orders_recipient_phone;
	private String orders_recipient_name;
	private Date orders_date;
	private int orders_idx;
	
	//Odersd_Details
	int quantity;
	
	//Products
	int products_idx;
	String products_name;
	int products_price;
	
	//products_img
	String img_url;
	
	//color
	String color;
	
	//size_table
	String size_product;

	
}
