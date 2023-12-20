/*
package com.example.shoppingmall_project.Controller;

import com.example.shoppingmall_project.model.vo.MembersVO;
import com.example.shoppingmall_project.service.SignUpService;
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
	private SignUpService ms;

	
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

	// 이석환 테스트 용
	@GetMapping("signUp2")
	public String signUp1() {
		return "signup/signUp2";
	}

	@PostMapping("signUp2")
	public String signUp1(MembersVO input, Model model) {

		ms.signUp(input);

		return "redirect:/";
	}

}
*/
//에러때문에 주석처리