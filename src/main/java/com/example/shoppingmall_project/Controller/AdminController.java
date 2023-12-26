package com.example.shoppingmall_project.Controller;

import com.example.shoppingmall_project.model.vo.ProductVO;
import com.example.shoppingmall_project.service.AdminService;
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
    public void members(Model model){
        model.addAttribute("list", as.getTable());
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
    
    @GetMapping("/updateProducts")
    public String updateProductsPage(){
        // 상품 수정 페이지 이동
        return "admin/updateProduct";
    }

    @PostMapping("/admin/updateProduct/${products_idx}")
    public String updateProducts(ProductVO input) {
        // 상품 수정
        adminService.product_update(input.getProducts_idx());

        return "redirect:/admin/productlist";
    }



}
