package com.example.shoppingmall_project.Controller;

import com.example.shoppingmall_project.service.HeaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/menu")
public class HeaderController {

    @Autowired private HeaderService hs;

    @GetMapping("/outer")
    public void outer(){}

    @GetMapping("/top")
    public void top(){}

    @GetMapping("/bottom")
    public void bottom(){}

    @GetMapping("/accessory")
    public void accessory(){}

    @PostMapping("/outer")
    public String REouter(){
        return "redirect:/menu/outer";
    }

    @PostMapping("/top")
    public String REtop(){
        return "redirect:/menu/top";
    }

    @PostMapping("/bottom")
    public String REbottom(){
        return "redirect:/menu/bottom";
    }

    @PostMapping("/accessory")
    public String REaccessory(){
        return "redirect:/menu/accessory";
    }
}
