package com.example.shoppingmall_project.Controller;

import com.example.shoppingmall_project.model.vo.MembersVO;
import com.example.shoppingmall_project.service.MembersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/")
public class MembersController {
	
	@Autowired
	private MembersService ms;

	
	// 회원가입 컨트롤러
	@GetMapping("signUp")
	public String signUp() {
		return "signup/signUp";
	}
	
	@PostMapping("signUp")
	public String signUp(MembersVO input, Model model) {
		
		ms.signUp(input);
		
		return "redirect:/";
	}

}
