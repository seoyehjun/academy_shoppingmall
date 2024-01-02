package com.example.shoppingmall_project.Controller;

import com.example.shoppingmall_project.model.vo.InquiriesVO;
import com.example.shoppingmall_project.service.HeaderService;
import com.example.shoppingmall_project.service.InquiriesService;
import com.example.shoppingmall_project.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService ps;
    @Autowired
    private InquiriesService is;

    @Autowired private HeaderService hs;

    @ModelAttribute
    public void menu(Model model){
        hs.addCommonAttributes(model);
    }


    @GetMapping("/homeProduct")

    public void productHome(@RequestParam("productIdx") int productIdx, Model model) {
        model.addAttribute("list", ps.getProductOne(productIdx)); //product 정보
        model.addAttribute("review", is.getInquiries()); //리뷰
        model.addAttribute("num", ps.getCountForProduct(productIdx));	// 사이즈
        model.addAttribute("color", ps.color(productIdx));	// 색상
        model.addAttribute("img", ps.getimg(productIdx));
    }

    @PostMapping("/homeProduct")
    public String write(InquiriesVO input) {
        is.writeinquiries(input);

        return "redirect:/product/homeProduct";
    }

}