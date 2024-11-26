package com.web.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SizeController {
	@GetMapping("/managerSize")
	public String SizeAdmin() {
		return "sizeAdmin";
	}
	
}
