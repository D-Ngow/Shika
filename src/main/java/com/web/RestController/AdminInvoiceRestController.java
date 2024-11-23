package com.web.RestController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.web.DAO.invoiceDetailsDAO;
import com.web.DAO.invoicesDAO;
import com.web.Entity.Invoices;
import com.web.Entity.Products;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.PathVariable;


@RestController
@RequestMapping("/manager/invoice")
public class AdminInvoiceRestController {
	
	@Autowired
	invoicesDAO ivDAO;
	@Autowired
	invoiceDetailsDAO ivdtDAO;
	@GetMapping("/findall")
	public List<Invoices> getallinvoice() {
		List<Invoices> listiv = ivDAO.findAll();
		return listiv;
	}
	
	@GetMapping("/findone/{ivid}")
	public List<Products> getoneinvoice(@PathVariable int ivid) {
		List<Products> listpro = ivdtDAO.findProductsByInvoiceId(ivid);
		return listpro;
	}
	@PostMapping("/")
	public String postMethodName(@RequestBody String entity) {
		//TODO: process POST request
		
		return entity;
	}
	
	@PutMapping("/changestt/{id}/{stt}")
	public void putMethodName(@PathVariable int id,@PathVariable int stt) {
		Invoices invoice = ivDAO.findById(id).get();
		invoice.setStatus(stt);
		ivDAO.save(invoice);
	}
	
	@GetMapping("/fill/{stt}/{date}")
	public List<Invoices> getFillbySttAndDate(@PathVariable int stt,@PathVariable String date) {
		Sort sort = date.equals("asc") ? Sort.by(Sort.Order.asc("createDate")) : Sort.by(Sort.Order.desc("createDate"));
		List<Invoices> listiv = null;
		if(stt==3) {
		listiv = ivDAO.findAll(sort);
		}else {
		listiv = ivDAO.findInvoicesByStatus(stt, sort);
		}
		
		return listiv;
	}
	
	
	
}
