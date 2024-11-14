package com.web.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/managerCategory")
public class AdminCategoryController {
	@GetMapping()
	public String getCate() {
		return "categoryAdmin";
	}
	
}
