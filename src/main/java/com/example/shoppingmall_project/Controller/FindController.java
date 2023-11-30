package com.example.shoppingmall_project.Controller;

import com.example.shoppingmall_project.model.vo.MembersVO;
import com.example.shoppingmall_project.service.FindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/find")
public class FindController {
    @Autowired private FindService fs;

    private String setMessage(int row, String msg, String location) {
        return "message";
    }

    @GetMapping
    public void find() {}

    @PostMapping("/findID")
    public String findID(String members_email, Model model) {
        String msg = fs.findID(members_email);

        model.addAttribute("row", 1);
        model.addAttribute("msg", msg);
        model.addAttribute("location", "home");

        return setMessage(1, msg, "home");
    }

    @PostMapping("/findPW")
    public String findPW(MembersVO input, Model model) {
        String msg = fs.findPW(input);

        model.addAttribute("row", 1);
        model.addAttribute("msg", msg);
        model.addAttribute("location", "home");

        return setMessage(1, msg, "home");
    }

    @PostMapping("/findPW/upPW/{members_id}")
    public String pwChange(@PathVariable String members_id, MembersVO input) {
        input.setMembers_id(members_id);
        fs.changePW(input);
        return "redirect:/login";
    }
}
