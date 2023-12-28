package com.example.shoppingmall_project.Controller;


import com.example.shoppingmall_project.model.vo.MembersVO;
import com.example.shoppingmall_project.model.vo.OrdersVO;
import com.example.shoppingmall_project.model.vo.ProductVO;
import com.example.shoppingmall_project.service.HeaderService;
import com.example.shoppingmall_project.service.OrdersService;
import com.example.shoppingmall_project.service.ProductService;
import com.example.shoppingmall_project.service.TestService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/product2")
public class OrderController {

    @Autowired
    private ProductService ps;

    @Autowired
    private OrdersService os;

    @Autowired
    private HttpSession session;

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
    public String orderProduct(@RequestParam(name = "quantity") int quantity, OrdersVO input,
                               @RequestParam(name = "action") String action, Model model,
                               HttpServletResponse response, HttpSession httpSession) throws SQLIntegrityConstraintViolationException {


        // 로그 또는 디버깅 메시지 추가
        System.out.println("Received data: " + input);

        // OrdersVO에서 size_product와 color 값을 가져옴
        String size_product = input.getSize_product();
        String color = input.getColor();
        int products_idx = input.getProducts_idx();
        MembersVO membersVO = (MembersVO) httpSession.getAttribute("user");





        System.out.println("color : " + color);
        System.out.println("size : " + size_product);
        System.out.println("idx : " + input.getProducts_idx());
        System.out.println("Received quantity: " + quantity);


        if ("BUY".equals(action)) {
            // sizeProduct와 color 값을 사용하여 insertOrders 메서드 호출
            int result = os.insertOrders(size_product, color, products_idx, quantity);

            // insert 성공 여부에 따라 리다이렉트 결정
            if (result > 0) {
                // 성공 시 모델에 데이터 추가
                model.addAttribute("size_product", size_product);
                model.addAttribute("color", color);
                // 사용된 idx를 불러와서 사용함
                int product_Idx = input.getProducts_idx();

                ProductVO product = ps.getProductByIdx(products_idx);
                System.out.println("product" + product);

                model.addAttribute("product", product);

                // 성공 시 리다이렉트
                return "redirect:/product2/orderProduct";
            } else {
                // 실패 시 예외 처리 또는 다른 동작 수행
                // 예: response.sendRedirect("/error");
                return "redirect:/error"; // 실패 시 리다이렉트 경로
            }
        } else if ("ADD".equals(action)) {
            // ADD TO CART 버튼 클릭 시 수행할 로직
            // 예: 장바구니 추가 로직


            int result = os.insertCart(size_product, color, products_idx, quantity);
            if (result > 0) {

            return "redirect:/mypage/myCartList";

            } else {
                // 실패 시 예외 처리 또는 다른 동작 수행
                // 예: response.sendRedirect("/error");
                return "redirect:/error"; // 실패 시 리다이렉트 경로
            }

        } else if ("WISH".equals(action)) {
            // WISH LIST 버튼 클릭 시 수행할 로직
            // 예시로 1로 설정했습니다. 실제로는 어떻게 결정되는지에 따라 수정이 필요합니다.
            /*Map<String,Object> map=new HashMap<>();
            map.put("quantity", input.getQuantity());
            map.put("color", input.getColor());
            map.put("size_product", input.getSize_product());
            httpSession.setAttribute("plusdataforwish", map);*/

            //products_idx = input.getProducts_idx();
            System.out.println("wellexecuted");
            Integer result = os.insertFavorites(input);
            System.out.println("result: "+result);

            if (result > 0) {

                return "redirect:/mypage/wishList";

            }else if(result == null) {
                // 실패 시 예외 처리 또는 다른 동작 수행
                // 예: response.sendRedirect("/error");
                return "/mypage/error"; // 실패 시 리다이렉트 경로
            }

        }
            return "redirect:/error";
    }

    @ExceptionHandler(SQLIntegrityConstraintViolationException.class)
    public String SQLExep() {
        System.out.println("insert exception ");

        return "/mypage/error";
    }

}

