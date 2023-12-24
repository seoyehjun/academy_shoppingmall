package com.example.shoppingmall_project.model.vo.mypagevo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class ReplyVO
{
    int replys_idx, inquiries_idx, admin_idx;
    String contents;
    Date write_date;
}
