package com.example.shoppingmall_project.Controller;

import com.example.shoppingmall_project.model.vo.MembersVO;
import com.example.shoppingmall_project.service.HeaderService;
import com.example.shoppingmall_project.service.LoginService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired private LoginService ls;

    @Autowired private HeaderService hs;

    @ModelAttribute
    public void menu(Model model){
        hs.addCommonAttributes(model);
    }

    @GetMapping("/login")
    public void login(HttpSession session) {

    }

    @PostMapping("/login")
    public String login(MembersVO input, HttpSession session, Model model) {

        input = ls.getLogin(input);

        if (input != null) {
            session.setAttribute("user", input);
            return "redirect:/";
        } else {
            // 로그인 실패 시, 에러 메시지를 모델에 추가
            model.addAttribute("loginError", "아이디 또는 비밀번호가 틀렸습니다.");
            return "login/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");

        return "redirect:/";
    }

}