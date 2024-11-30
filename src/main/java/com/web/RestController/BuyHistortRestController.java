package com.web.RestController;

import org.springframework.web.bind.annotation.RestController;

import com.web.DAO.invoiceDetailsDAO;
import com.web.DAO.invoicesDAO;
import com.web.DAO.productsDAO;
import com.web.Entity.InvoiceDetails;
import com.web.Entity.Invoices;
import com.web.Entity.Products;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


@RestController
public class BuyHistortRestController {
	@Autowired
	invoiceDetailsDAO ivdDAO;
	@Autowired
	invoicesDAO ivDAO;
	@Autowired
	productsDAO proDAO;
	
	@PostMapping("/buyHistory/cancel/{id}")
	public void cancel(@PathVariable int id) {
		List<InvoiceDetails> listIvd = ivdDAO.findByinvoiceId(id);
		for (InvoiceDetails ivd : listIvd) {
			Products pro = proDAO.findById(ivd.getDetail().getProduct().getProductId());
			pro.setQuantity(pro.getQuantity() + ivd.getQuantity());
			proDAO.save(pro);
		}
		Invoices iv = ivDAO.findByInvoiceId(id);
		iv.setStatus(2);
		ivDAO.save(iv);
	}
	
}
