package com.example.shoppingmall_project.Controller;

import com.example.shoppingmall_project.model.vo.MembersVO;
import com.example.shoppingmall_project.service.LoginService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

    @Autowired private LoginService ls;

    @GetMapping("/login")
    public void login(HttpSession session) {
        session.removeAttribute("find");

    }

    @PostMapping("/login")
    public String login(MembersVO input, HttpSession session) {

        input = ls.getLogin(input);

        if (input != null) {
            session.setAttribute("user", input);
        }

        return "redirect:/";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");

        return "redirect:/";
    }

}