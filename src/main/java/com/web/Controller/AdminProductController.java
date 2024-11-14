package com.web.Controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/manager")
public class AdminProductController 
{
	
	@GetMapping("/product")
	public String index() 
	{
		System.out.println(1);
		return "productAdmin";
	}


}
