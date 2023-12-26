package com.example.shoppingmall_project.Controller;

import com.example.shoppingmall_project.model.vo.ProductVO;
import com.example.shoppingmall_project.service.AdminService;
import com.example.shoppingmall_project.service.OrdersService;
import com.example.shoppingmall_project.service.ProductService;
import com.example.shoppingmall_project.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    ProductService ps;
    @Autowired
    TestService as;
    @Autowired
    OrdersService os;
    @Autowired
    AdminService adminService;

    @GetMapping("/addProduct")
    public void addProduct(){}

    // 상품 등록 보류
//    @PostMapping("/addProduct")
//    public String addProductData(ProductVO input){
//
//        adminService.addProductdata(input);
//
//
//        return "admin/productlist";
//    }

//    @GetMapping("/orders")
//    public void orders(Model model){
//        model.addAttribute("list", os.adminOrder());
//    }

    @GetMapping("/members")
    public String members(Model model){
        model.addAttribute("list", as.getTable());
        model.a


        return "admin/members";
    }

    @GetMapping("/productlist")
    public void productlist(Model model){
        model.addAttribute("list", ps.productList());
    }

//    @GetMapping("/delete/{products_idx}")
//    public String deleteget(){
//        return "admin/productlist";
//    }
    
    @GetMapping ("/delete/{products_idx}")
    public String delete(ProductVO input) {
        // 상품 삭제
        adminService.product_delete(input.getProducts_idx());

        return "redirect:/admin/productlist";
    }
    
    @GetMapping("/updateProducts/{products_idx}")
    public String updateProductsPage(@PathVariable int products_idx, Model model){
        // 상품 수정 페이지 이동
        model.addAttribute("productTable",adminService.getProductOne(products_idx));

        return "admin/updateProduct";
    }

    @PostMapping("/updateProduct/{products_idx}")
    public String updateProducts(@PathVariable int products_idx, ProductVO input ) {
        // 상품 수정
        input.setProducts_idx(products_idx);
        adminService.product_update(input);

        return "redirect:/admin/productlist";
    }



}
