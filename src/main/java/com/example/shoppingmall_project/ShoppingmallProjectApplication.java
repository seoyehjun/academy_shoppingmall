package com.example.shoppingmall_project;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@EnableAspectJAutoProxy
@SpringBootApplication
public class ShoppingmallProjectApplication {
    // 실행 하는 main

    public static void main(String[] args) {
        SpringApplication.run(ShoppingmallProjectApplication.class, args);
    }

}