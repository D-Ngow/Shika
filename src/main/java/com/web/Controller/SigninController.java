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
	
	@PostMapping("/submit")
	public String postLogin() {
//		AccountDetail user = (AccountDetail) usersv.loadUserByUsername(req.getParameter("username"));
//		if(user != null && user.getPassword().equals(req.getParameter("password"))){
//			Authentication auth = new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword(), user.getAuthorities());
//			SecurityContextHolder.getContext().setAuthentication(auth);
//			String savedUri = (String) req.getSession().getAttribute("uri");
//			System.out.println(savedUri);
//	        return "redirect:/cart";
//		}else {
//			return "signin";
//		}
		
		return "/home";
		
	}
//	@PostMapping("/submit")
//	public String postLogin() {
//	    UsernamePasswordAuthenticationToken authReq = 
//	        new UsernamePasswordAuthenticationToken(req.getParameter("email"), req.getParameter("password"));
//	    try {
//	        Authentication auth = authManager.authenticate(authReq);
//	        SecurityContextHolder.getContext().setAuthentication(auth);
//	        String savedUri = (String) req.getSession().getAttribute("uri");
//	        return "redirect:" + (savedUri != null ? savedUri : "/home");
//	    } catch (AuthenticationException e) {
//	        return "signin";
//	    }
//	}
// làm cách này GPT viết nhưng nó kẹt login XD 

}