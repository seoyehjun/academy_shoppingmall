package com.example.shoppingmall_project.Controller;

import com.example.shoppingmall_project.model.vo.ProductVO;
import com.example.shoppingmall_project.service.OrdersService;
import com.example.shoppingmall_project.service.ProductService;
import com.example.shoppingmall_project.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    ProductService ps;
    @Autowired
    TestService as;
    @Autowired
    OrdersService os;

    @GetMapping("/addProduct")
    public void addProduct(){}

    @PostMapping("/addProduct")
    public String addProductData(ProductVO input){

        ps.addProductdata(input);


        return "admin/productlist";
    }

//    @GetMapping("/orders")
//    public void orders(Model model){
//        model.addAttribute("list", os.adminOrder());
//    }

    @GetMapping("/members")
    public void members(Model model){
        model.addAttribute("list", as.getTable());
    }

    @GetMapping("/productlist")
    public void productlist(Model model){
        model.addAttribute("list", ps.productList());
    }



}
