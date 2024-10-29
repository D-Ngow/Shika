package com.web.Controller;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web.Entity.Users;

@Controller
@RequestMapping("/signin")
public class SignInController {
	
	@GetMapping()
	private String signin() {
		return "signin";
	}
	
	@GetMapping("/success")
	public ResponseEntity<String> successfully()
	{
		
		return ResponseEntity.ok("Login is successfully");
	}
	
	
}	
