package com.example.shoppingmall_project.Controller;

import com.example.shoppingmall_project.model.vo.MembersVO;
import com.example.shoppingmall_project.service.FindService;
import com.example.shoppingmall_project.service.HeaderService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("login/find")
public class FindController {
    @Autowired private FindService fs;
    @Autowired private HeaderService hs;

    @ModelAttribute
    public void menu(Model model){
        hs.addCommonAttributes(model);
    }

    private String setMessage(int row, String msg, String location) {
        return "login/message";
    }

    @GetMapping("/findID")
    public void findID(){}

    @PostMapping("/findID")
    public String findID(String members_email, Model model) {
        String msg = fs.findID(members_email);

        model.addAttribute("row", 1);
        model.addAttribute("msg", msg);
        model.addAttribute("location", "login/login");

        return setMessage(1, msg, "login/login");
    }

    @GetMapping("/findPW")
    public void findPW(){}

    @PostMapping("/findPW")
    public String findPW(MembersVO input, Model model) {
        String msg = fs.findPW(input);

        model.addAttribute("row", 1);
        model.addAttribute("msg", msg);
        model.addAttribute("location", "login/login");

        return setMessage(1, msg, "login/login");
    }
}
