package com.example.shoppingmall_project.AOP;

import com.example.shoppingmall_project.conponents.SH512;
import com.example.shoppingmall_project.model.vo.MembersVO;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.security.NoSuchAlgorithmException;

@Component
@Aspect
public class SignUpAOP {

    @Autowired private SH512 hash;

    @Before("execution(* com.example.shoppingmall_project.service.SignUpService.*(com.example.shoppingmall_project.model.vo.MembersVO, ..)) " +
            "|| execution(* com.example.shoppingmall_project.service.LoginService.*(com.example.shoppingmall_project.model.vo.MembersVO, ..))")
    public void hash(JoinPoint jp) throws NoSuchAlgorithmException {
        MembersVO input = (MembersVO)jp.getArgs()[0];

        if(input.getMembers_password() == null){
            input.setMembers_password("0");
        }

        input.setMembers_password(hash.getHash(input.getMembers_password()));

    }

}
