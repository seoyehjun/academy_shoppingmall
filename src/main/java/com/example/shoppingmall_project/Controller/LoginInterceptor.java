package com.example.shoppingmall_project.Controller;

import com.example.shoppingmall_project.model.vo.MembersVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, @NotNull HttpServletResponse response, @NotNull Object handler)
            throws Exception {
        HttpSession session = request.getSession();
        MembersVO user = (MembersVO) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("/login/login");
            return false;
        } else {
            return true;
        }

    }


}
