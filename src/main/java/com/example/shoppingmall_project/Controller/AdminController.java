package com.example.shoppingmall_project.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @GetMapping("/addProduct")
    public void addProduct(){

    }

    @GetMapping("/orders")
    public void orders(){

    }

}
