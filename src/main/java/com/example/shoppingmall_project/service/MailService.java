package com.example.shoppingmall_project.service;

import com.example.shoppingmall_project.model.vo.MailVO;
import lombok.RequiredArgsConstructor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MailService {

    private final JavaMailSender javaMailSender;

    private static final String senderEmail="nyg159@gmail.com";


    public void CreateMail(MailVO mailVO) {

        SimpleMailMessage message = new SimpleMailMessage();

        message.setTo(mailVO.getReceiver());
        message.setFrom(senderEmail);
        message.setSubject(mailVO.getTitle());
        message.setText(mailVO.getContent());

        javaMailSender.send(message);
    }
}
