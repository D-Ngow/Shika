package com.web.Controller;

import java.text.SimpleDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
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
public class SignupController {

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private UserService userSv;
	
	@Autowired
	HttpServletRequest req;
	
	@GetMapping("/signup")
	private String signup() {
		return "signup";

	}

 	@PostMapping("/submit")
 	public String signupSubmit() {
 		String mess = null;
 		String stat = null;
 		try {
 			Users user = userSv.findByEmail(req.getParameter("email"));
 			if (user==null) {
 				user = new Users();
 				user.setEmail(req.getParameter("email"));
 	 			user.setName(req.getParameter("name"));
 				user.setPhoneNumber(req.getParameter("phone"));
 				user.setPassword(passwordEncoder.encode(req.getParameter("password")));
 	 			user.setGender(Boolean.parseBoolean(req.getParameter("gender")));
 				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
 	 			user.setBirthday(sdf.parse(req.getParameter("birthday")));
 	 			user.setRole(false);
 	 			userSv.saveUser(user);
			}else {
				mess = "Email is already used";
				stat= "warning";
				return "redirect:/signup?message="+mess+"&&status="+stat;
			}
 		} catch (Exception e) {
 			System.out.println(e);
 			mess = "Something wrong, please try again";
 			stat= "error";
			return "redirect:/signup?message="+mess+"&&status="+stat;
 		}
		mess = "Sign up success";
		stat= "success";
 		return "redirect:/signin?message="+mess+"&&status="+stat;
 	}


}