package com.example.shoppingmall_project.Controller;

import com.example.shoppingmall_project.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ImageController {

    @Autowired
    private ImageService is;

    @GetMapping("/displayImage")
    public String displayImage(Model model) {
        model.addAttribute("imageList", is.getAllImageNames());
        return "imageDisplay"; // 이는 JSP 페이지의 이름입니다. 해당 페이지로 데이터를 전달합니다.
    }
}
