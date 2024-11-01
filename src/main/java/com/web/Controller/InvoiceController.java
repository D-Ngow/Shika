package com.web.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.web.Entity.Invoices;
import com.web.Entity.Users;
import com.web.Service.InvoiceService;
import com.web.Service.UserService;

@Controller
@RequestMapping("/invoice")
public class InvoiceController {

	@Autowired
	InvoiceService invoiceService;

	@Autowired
	UserService userServer;

	@GetMapping("/{id}")
	public List<Invoices> getInvoice(@PathVariable int id){

		Users user = userServer.findById(id);

		List<Invoices> invoices = invoiceService.findByUser(user);

		return invoices;
	}

}