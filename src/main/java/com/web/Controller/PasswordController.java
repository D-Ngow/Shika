package com.web.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class PasswordController {
	
	@GetMapping("/changePass")
	public String getChangePass() {
		return "changePass";
	}
	
}
