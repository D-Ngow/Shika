package com.web.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminInvoiceController {
	@GetMapping("/managerInvoice")
	public String getMethodName() {
		return "invoicesAdmin";
	}
	
}
