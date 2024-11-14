package com.web.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.Entity.Users;
import com.web.Service.UserService;


@Controller
public class PasswordController {
	@Autowired
	UserService userService;
	
	@GetMapping("/changePass")
	public String getChangePass(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Users user = userService.findByEmail(auth.getName());
		model.addAttribute("user", user);
		return "changePass";
	}
	
}
