package com.example.shoppingmall_project.Controller;

import com.example.shoppingmall_project.service.HeaderService;
import com.example.shoppingmall_project.service.ImageService;
import com.example.shoppingmall_project.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/menu")
public class HeaderController {

    @Autowired private HeaderService hs;
    @Autowired private ImageService is;
    @Autowired private ProductService ps;

    @ModelAttribute
    public void menu(Model model){
        hs.addCommonAttributes(model);
        hs.getImg(model);
    }


    @GetMapping("/outer")
    public void outer(Model model){
        model.addAttribute("list", ps.menuProduct(1));
    }
    @GetMapping("/outer/{idx}")
    public  String outerList(@PathVariable int idx, Model model){
        model.addAttribute("list", hs.getSub(idx));

        return "menu/outer";
    }

    @GetMapping("/top")
    public void top(Model model){
        model.addAttribute("list", ps.menuProduct(2));
    }

    @GetMapping("/top/{idx}")
    public  String topList(@PathVariable int idx, Model model){
        model.addAttribute("list", hs.getSub(idx));

        return "menu/outer";
    }

    @GetMapping("/bottom")
    public void bottom(Model model){
        model.addAttribute("list", ps.menuProduct(3));
    }

    @GetMapping("/bottom/{idx}")
    public  String bottomList(@PathVariable int idx, Model model){
        model.addAttribute("list", hs.getSub(idx));

        return "menu/outer";
    }

    @GetMapping("/accessory")
    public void accessory(Model model){
        model.addAttribute("list", ps.menuProduct(4));
    }

    @GetMapping("/accessory/{idx}")
    public  String accist(@PathVariable int idx, Model model){
        model.addAttribute("list", hs.getSub(idx));

        return "menu/outer";
    }

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
