package com.web.Service;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.web.DAO.cartsDAO;
import com.web.DAO.invoiceDetailsDAO;
import com.web.DAO.invoicesDAO;
import com.web.DAO.usersDAO;
import com.web.Entity.Cart;
import com.web.Entity.InvoiceDetails;
import com.web.Entity.Invoices;
import com.web.Entity.Users;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class OderService {
	@Autowired
	cartsDAO cartDAO;
	@Autowired
	usersDAO usDAO;
	@Autowired
	invoicesDAO ivDAO;
	@Autowired
	invoiceDetailsDAO ivdtDAO;
	public void checkout(String email,boolean checkout) {
		if(!checkout) {
			throw new IllegalStateException("Payment Fail Try Again");
		}
		List<Cart> listcart = cartDAO.findByEmail(email);
		double total = 0;
		for (Cart cart : listcart) {
			total+= cart.getDetail().getProduct().getPrice() * cart.getQuantity() - cart.getDetail().getProduct().getDiscountPrice() * cart.getQuantity() ;
			}
		//Find User
		Users user = usDAO.findByEmail(email); 
		//New invoice
		Invoices invoice = new Invoices();
		invoice.setUser(user);
		invoice.setCreateDate(new Date());
		invoice.setStatus(false);
		invoice.setTotal(total);
		ivDAO.save(invoice);
		
		for (Cart cart : listcart) {
			InvoiceDetails ivdt = new InvoiceDetails();
			ivdt.setInvoice(invoice);
			ivdt.setDetail(cart.getDetail());
			ivdt.setPrice(cart.getDetail().getProduct().getPrice());
			ivdt.setQuantity(cart.getQuantity());
			ivdtDAO.save(ivdt);
		}
		cartDAO.deleteAll(listcart);
	}
}
