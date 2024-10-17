package com.web.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.Entity.InvoiceDetails;

public interface invoiceDetailsDAO extends JpaRepository<InvoiceDetails,Integer>{

}
