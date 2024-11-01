package com.web.Controller;

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

@Controller
@RequestMapping("/signup")
public class SignupController {

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private usersDAO userDao;

	@GetMapping
	private String signup() {
		return "signup";

	}

	@PostMapping()
	public ResponseEntity<Users> signup(@RequestBody Users user){

	System.out.println("hihi");
		user.setPassword(passwordEncoder.encode(user.getPassword()));	
		Users savedUser = userDao.save(user);


		return new ResponseEntity<>(savedUser,HttpStatus.CREATED);
	}

}