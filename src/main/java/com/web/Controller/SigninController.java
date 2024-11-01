package com.web.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.Security.AccountDetail;
import com.web.Service.UserService;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestBody;


@Controller
@RequestMapping("/signin")
public class SigninController {
	
	@Autowired
	HttpServletRequest req;
	
	@Autowired
	UserService usersv;
	
	@GetMapping()	
	private String signin() {
		return "signin";
	}
	
	@PostMapping("/submit")
	public String postLogin() {
		AccountDetail ad = (AccountDetail) usersv.loadUserByUsername(req.getParameter("email"));
		if(ad.getPassword().equals(req.getParameter("password"))){
			return "redirect:/home";
		}else {
			return "signin";
		}
		
	}
	
	
	@GetMapping("/success")
	public ResponseEntity<String> successfully()
	{
		return ResponseEntity.ok("Login is successfully");
	}

}