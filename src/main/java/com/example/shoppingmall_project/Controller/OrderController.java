package com.example.shoppingmall_project.Controller;


import com.example.shoppingmall_project.model.vo.OrdersVO;
import com.example.shoppingmall_project.model.vo.ProductVO;
import com.example.shoppingmall_project.service.HeaderService;
import com.example.shoppingmall_project.service.OrdersService;
import com.example.shoppingmall_project.service.ProductService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/product2")
public class OrderController {

    @Autowired
    private ProductService ps;

    @Autowired
    private OrdersService os;

    @Autowired private HeaderService hs;

    @ModelAttribute
    public void menu(Model model){
        hs.addCommonAttributes(model);
    }

    @GetMapping("/orderProduct")
    public String orderProductGet(Model model, HttpServletRequest request) {

        return "product2/orderProduct";
    }

    @PostMapping("/orderProduct")
    public String orderProduct(OrdersVO input, Model model, HttpServletResponse response) {
        // 로그 또는 디버깅 메시지 추가
        System.out.println("Received data: " + input);

        // OrdersVO에서 size_product와 color 값을 가져옴
        String size_product = input.getSize_product();
        String color = input.getColor();

        System.out.println("color : " + color);
        System.out.println("size : " + size_product);
        System.out.println("idx : " + input.getProducts_idx());

        // sizeProduct와 color 값을 사용하여 insertOrders 메서드 호출
        int result = os.insertOrders(size_product, color);

        // insert 성공 여부에 따라 리다이렉트 결정
        if (result > 0) {
            // 성공 시 모델에 데이터 추가
            model.addAttribute("size_product", size_product);
            model.addAttribute("color", color);
            // 사용된 idx를 불러와서 사용함
            int product_Idx = input.getProducts_idx();
            ProductVO product = ps.getProductByIdx(product_Idx);
            System.out.println("product" + product);

            model.addAttribute("product", product);

            // 성공 시 리다이렉트
            return "/product2/orderProduct";
        } else {
            // 실패 시 예외 처리 또는 다른 동작 수행
            // 예: response.sendRedirect("/error");
            return "redirect:/error"; // 실패 시 리다이렉트 경로
        }

    }
}

