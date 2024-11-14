package com.web.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.DAO.invoicesDAO;
import com.web.Entity.Invoices;
import com.web.Entity.Users;

@Service
public class InvoiceService {

	 @Autowired
	 invoicesDAO invoiceDao;

	 public List<Invoices> findByUser(Users user) {

		 List<Invoices> invoices = invoiceDao.findByuserid(1);
		 return invoices;
	 }
}
