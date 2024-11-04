package com.web.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import com.web.Entity.Users;
import com.web.Service.UserService;

@Controller
@RequestMapping("/profile")
public class ProfileController {

	@Autowired
	private UserService userService;

	@GetMapping()
	public String GetProfile(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Users user = userService.findByEmail(auth.getName());
		model.addAttribute("user", user);
		return "profile";
	}

//	@PostMapping()
//	public String EditProfile (@RequestBody Users user) {
//		userService.EditProfile(user);
//		return "redirect:/profile";
//	}


}