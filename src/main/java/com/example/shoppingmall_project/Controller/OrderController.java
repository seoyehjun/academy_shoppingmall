package com.example.shoppingmall_project.Controller;


import com.example.shoppingmall_project.model.vo.MembersVO;
import com.example.shoppingmall_project.model.vo.OrdersVO;
import com.example.shoppingmall_project.model.vo.ProductVO;
import com.example.shoppingmall_project.service.HeaderService;
import com.example.shoppingmall_project.service.OrdersService;
import com.example.shoppingmall_project.service.ProductService;
import com.example.shoppingmall_project.service.TestService;
import com.fasterxml.jackson.core.JsonProcessingException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.awt.datatransfer.DataFlavor;
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

    @Autowired
    private HeaderService hs;

    @ModelAttribute
    public void menu(Model model) {
        hs.addCommonAttributes(model);
    }

    @GetMapping("/orderProduct")
    public String orderProductGet(@RequestParam(name = "idx") int productIdx, Model model, HttpSession httpSession) {
        // 회원 정보 가져오기
        MembersVO membersVO = (MembersVO) httpSession.getAttribute("user");
        // 모델에 회원 정보 추가
        model.addAttribute("members", membersVO);  // 모델에 members 속성 추가;

        ProductVO productVO = ps.getProductByIdx(productIdx);
        System.out.println("Product Name: " + productVO.getProducts_name());  // 디버깅을 위한 출력
        System.out.println("Product Price: " + productVO.getProducts_price());  // 디버깅을 위한 출력

        model.addAttribute("product", productVO);

        return "product2/orderProduct";

    }

    @GetMapping("/addToDatabase")
    public String addToDatabaseGet() {
        // GET 요청에 대한 응답 처리
        // 예: return "redirect:/"; 또는 다른 경로로 리다이렉트
        return "redirect:/";
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


        model.addAttribute("members", membersVO);


        System.out.println("color : " + color);
        System.out.println("size : " + size_product);
        System.out.println("idx : " + input.getProducts_idx());
        System.out.println("Received quantity: " + quantity);


        if ("BUY".equals(action)) {


            // insert 성공 여부에 따라 리다이렉트 결정

                model.addAttribute("color", color);
                model.addAttribute("size_product", size_product);
                model.addAttribute("products_idx", products_idx);

                // 리다이렉트 대신에 포워드 사용
                // 제품 정보를 다시 가져와서 모델에 추가
                ProductVO productVO = ps.getProductByIdx(products_idx);
                model.addAttribute("product", productVO);

                double unitPrice = productVO.getProducts_price();
                double totalPrice = unitPrice * quantity;

                model.addAttribute("totalPrice", totalPrice);
                model.addAttribute("quantity", quantity);


                return "product2/orderProduct";


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

            } else {
                // 실패 시 예외 처리 또는 다른 동작 수행
                // 예: response.sendRedirect("/error");
                return "/mypage/error"; // 실패 시 리다이렉트 경로
            }

            }
    
        // 추가적인 로직이 필요한 경우 처리
        return "redirect:/error";
        }


    @PostMapping("/addToDatabase")
    @ResponseBody
    public String addToDatabase(
            @RequestParam(name = "addr1") String addr1,
            @RequestParam(name = "addr2") String addr2,
            @RequestParam(name = "addr3") String addr3,
            @RequestParam(name = "phone-number") String phoneNumber,
            @RequestParam(name = "delivery-message") String deliveryMessage,
            @RequestParam(name = "members_nickname") String membersNickname,
            @RequestParam(name = "members_idx") String membersIdx,
            @RequestParam(name = "total_Price") String totalPrice

    ) {
        // 값이 정상적으로 받아와지는지 확인하기 위해 로깅 문 추가
        System.out.println("받아온 값 확인:");
        System.out.println("addr1: " + addr1);
        System.out.println("addr2: " + addr2);
        System.out.println("addr3: " + addr3);
        System.out.println("phone-number: " + phoneNumber);
        System.out.println("delivery-message: " + deliveryMessage);
        System.out.println("members_nickname: " + membersNickname);
        System.out.println("members_idx: " + membersIdx);
        System.out.println("total_Price: " + totalPrice);




        // totalPrice를 double로 변환
        double convertedTotalPrice = Double.parseDouble(totalPrice.replace(",", ""));

        // OrdersService에서 주문 정보를 추가하는 로직을 호출
        OrdersService ordersService = new OrdersService();
        int result = os.insertOrders(addr1, addr2, addr3, phoneNumber, deliveryMessage, membersNickname, membersIdx, convertedTotalPrice);

        if (result > 0) {
            // 추가된 주문 정보를 데이터베이스에 삽입
            return "success"; // 성공 시 클라이언트에게 success를 반환

        } else {
            return "failure"; // 주문 정보 삽입 실패 시 클라이언트에게 실패를 반환
        }
    }


}
