package com.example.shoppingmall_project.Configuration;

import com.example.shoppingmall_project.Controller.LoginInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
//    jsp 기본 세팅들
    @Override
public void addInterceptors(InterceptorRegistry registry) {
    registry.addInterceptor(new LoginInterceptor())
            .addPathPatterns("/product2/**")  // 적용할 URL 패턴
            .excludePathPatterns("/login/login");  // 제외할 URL 패턴
}
}

