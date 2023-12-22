package com.example.shoppingmall_project.model.vo.mypagevo;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class O_P_OD_vo
{
	//ORDERS ���̺�
	public int orders_idx;
	public Date orders_date;
	public String orders_status;
	
	//PRODUCTS ���̺�
	public String products_name;
	public int products_idx;
	
	//ORDERS_DETAILS ���̺�
	public int quantity;

	public String members_id;

}
