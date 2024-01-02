package com.example.shoppingmall_project.model.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrdersVO {
    private int orders_details, quantity, orders_idx, members_idx;
    private int products_idx, color_idx, size_idx;
    private String color;
    private String size_product;
    private String ordersNumberAddress;
    private String ordersDeliveryMessage;
    private String ordersRecipientAddress;
    private String ordersDetailedAddress;
    private String ordersRecipientPhone;
    private Double ordersTotalPrice;
    private int membersIdx;
    private String ordersRecipientName;
}
