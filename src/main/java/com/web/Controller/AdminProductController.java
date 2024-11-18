package com.web.Controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/managerProduct")
public class AdminProductController 
{
	
	@GetMapping("")
	public String index() 
	{
		return "productAdmin";
	}


}
