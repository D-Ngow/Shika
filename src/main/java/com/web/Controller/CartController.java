package com.web.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CartController {
	@GetMapping("path")
	public String getMethodName(@RequestParam String param) {
		return new String();
	}
	
}
