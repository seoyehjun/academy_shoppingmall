package com.example.shoppingmall_project.Controller;

import ch.qos.logback.core.net.SyslogOutputStream;
import com.example.shoppingmall_project.model.vo.MailVO;
import com.example.shoppingmall_project.service.MailService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
public class MailController {

    private final MailService mailService;

//    @GetMapping("/mail")
//    public String MailPage(){
//        return "signup/mail";
//    }

    @PostMapping("/mail")
    @ResponseBody
    public String MailSend(String mail){
        System.out.println("실행");

        int number = mailService.sendMail(mail);

        String num = "" + number;


        return num;
    }

}
