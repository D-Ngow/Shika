package com.web.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.DAO.invoiceDetailsDAO;
import com.web.DAO.invoicesDAO;
import com.web.Entity.InvoiceDetails;
import com.web.Entity.Invoices;
import com.web.Entity.Users;
import com.web.Service.UserService;

@Controller
public class BuyHistoryController {
	@Autowired
	UserService userService;
	@Autowired
	invoicesDAO ivDAO;
	@Autowired
	invoiceDetailsDAO ivdtDAO;
	@GetMapping("/buyhistory")
	public String getBuyHistory(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Users us = userService.findByEmail(auth.getName());
		
		List<Invoices> listinvoice = ivDAO.findByuserid(us.getUserId());
		model.addAttribute("listiv",listinvoice);
		
		return "buyHistory";
	}
	
}
