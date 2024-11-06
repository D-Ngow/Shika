package com.web.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.web.DAO.usersDAO;
import com.web.Service.UserService;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/signin")
public class SigninController {
	
	@Autowired
	HttpServletRequest req;
	
	
	@Autowired
	UserService usersv;
	
	@Autowired 
	usersDAO userDAO;
	
	@GetMapping()	
	private String signin() {
		return "signin";
	}
}
