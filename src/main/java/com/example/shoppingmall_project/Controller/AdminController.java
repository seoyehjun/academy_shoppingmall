package com.example.shoppingmall_project.Controller;

import com.example.shoppingmall_project.model.vo.AddProductVO;
import com.example.shoppingmall_project.model.vo.AdminOrdersVO;
import com.example.shoppingmall_project.model.vo.ProductVO;
import com.example.shoppingmall_project.service.AdminService;
import com.example.shoppingmall_project.service.OrdersService;
import com.example.shoppingmall_project.service.ProductService;
import com.example.shoppingmall_project.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

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

    

    @GetMapping("/productlist")
    public void productlist(Model model){
        model.addAttribute("list", ps.productList());
    }

    
    @GetMapping ("/delete/{products_idx}")
    public String delete(@PathVariable int products_idx) {
        // 상품 삭제
        adminService.product_delete(products_idx);

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

    @GetMapping("/members")
    public String members(Model model){
        // 배송 수정 페이지
        // 주문 리스트 출력
        model.addAttribute("list", adminService.orderlist());


        return "admin/members";
    }

    @GetMapping("/updateOrders/{orders_idx}")
    public String updateOrderPage(@PathVariable int orders_idx, Model model){

        model.addAttribute("ordersTable",adminService.getOrdersOne(orders_idx));


        return "admin/updateOrders";
    }

    @PostMapping("/updateOrders/{orders_idx}")
    public String updateOrderlist(@PathVariable int orders_idx, AdminOrdersVO input){

        input.setOrders_idx(orders_idx);
        adminService.orderUpdate(input);

        return "redirect:/admin/members";
    }
    @GetMapping("/addProduct")
    public void addProduct(Model model){
        // 상품 등록 페이지
        // 카테고리 데이터
        model.addAttribute("category", adminService.getCateList());
        model.addAttribute("sizes", adminService.getSizeList());
        model.addAttribute("colors", adminService.getColorList());


    }
    
    @PostMapping("/addProduct")
    public String addProductData(@ModelAttribute AddProductVO input,
                                 @RequestParam(value = "sizes", required = false) List<Integer> sizes,
                                 @RequestParam(value = "colors", required = false) List<Integer> colors,
                                 @RequestParam(value = "files", required = false)MultipartFile[] files){

        // 상품 등록
        System.out.println("TEST : cate1 : "+ input.getCategories_idx());
        System.out.println("TEST : name1 : "+ input.getProducts_name());
        System.out.println("TEST : price1 : "+ input.getProducts_price());
        System.out.println("TEST : stock1 : "+ input.getProducts_stock());

        System.out.println("TEST : color1 : "+ colors.toString());

        adminService.addProductdata(input, sizes, colors, files);


        return "redirect:/admin/productlist";
    }
    

}
