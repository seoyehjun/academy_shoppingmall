package com.example.shoppingmall_project.Controller;

import com.example.shoppingmall_project.service.MailService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
public class MailController {

    private final MailService mailService;

    @PostMapping("/mail")
    @ResponseBody
    public String MailSend(String mail){
        System.out.println("실행");

        int number = mailService.sendMail(mail);

        String num = "" + number;


        return num;
    }

}
