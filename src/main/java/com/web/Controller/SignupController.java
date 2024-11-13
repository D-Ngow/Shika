package com.web.Controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.Entity.Users;
import com.web.Service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

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
	private String signup(@ModelAttribute("us") Users us) {
		return "signup";

	}
	
	@PostMapping()
	public String signupSubmit(Model model, @Valid @ModelAttribute("us") Users us, BindingResult result) {
    	System.out.println("0");
    	System.out.println("err: " +result);
    	System.out.println("bir: " +us.getBirthday());
	    if (result.hasErrors()) {
	        model.addAttribute("message", "Lỗi rồi kìa, vui lòng kiểm tra lại nhé!");
	        return "signup"; 
	    } else {
	        try {
	        	System.out.println("1");
	            Users user = new Users();
	            user.setEmail(us.getEmail());
	            user.setName(us.getName());
	            user.setPhoneNumber(us.getPhoneNumber());
	            user.setPassword(passwordEncoder.encode(us.getPassword()));
	            user.setGender(us.getGender());
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	            user.setBirthday( us.getBirthday());
	            user.setRole(false);
	            System.out.println("user: " + user);
	            userSv.EditProfile(user);
	            return "redirect:/signin";
	            
	        } catch (Exception e) {
	            System.out.println(e);
	            return "signup";
	        }
	    }
	}

	

}