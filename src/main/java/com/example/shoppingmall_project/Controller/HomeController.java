package com.example.shoppingmall_project.Controller;

import com.example.shoppingmall_project.service.HeaderService;
import com.example.shoppingmall_project.service.ProductService;
import com.example.shoppingmall_project.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    private TestService as;
    @Autowired
    private HeaderService hs;
    @Autowired
    private ProductService ps;

    @GetMapping
    public String home(Model model){
        model.addAttribute("outer", hs.getOuter(1));
        model.addAttribute("top", hs.getOuter(2));
        model.addAttribute("bottom", hs.getOuter(3));
        model.addAttribute("accessory", hs.getOuter(4));

        model.addAttribute("list", ps.getProduct());

        return "mainpage";
    }

    // 테스트 컨트롤러
    @GetMapping("table")
    public String accountTable(Model model){
        model.addAttribute("list",as.getTable());
        return "TestTable";
    }


}
