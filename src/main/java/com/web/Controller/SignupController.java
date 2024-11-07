package com.web.Controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.DAO.usersDAO;
import com.web.Entity.Users;
import com.web.Service.UserService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/signup")
public class SignupController {

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private UserService userSv;
	
	@Autowired
	HttpServletRequest req;

	@GetMapping
	private String signup() {
		return "signup";

	}
	//hihi
	@PostMapping("/submit")
	public String signupSubmit() {
		try {
			Users user = new Users();
			user.setEmail(req.getParameter("email"));
			user.setName(req.getParameter("name"));
			user.setPhoneNumber(req.getParameter("phone"));
			user.setPassword(passwordEncoder.encode(req.getParameter("password")));
			user.setGender(Boolean.parseBoolean(req.getParameter("gender")));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			user.setBirthday(sdf.parse(req.getParameter("birthday")));
			user.setRole(false);
			
			userSv.EditProfile(user);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return "redirect:/signin";
	}
	

}