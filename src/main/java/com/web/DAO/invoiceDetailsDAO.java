package com.web.DAO;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.web.Entity.InvoiceDetails;

public interface invoiceDetailsDAO extends JpaRepository<InvoiceDetails,Integer>{
	@Query("SELECT i FROM InvoiceDetails i WHERE i.invoice.invoiceId =:id")
    List<InvoiceDetails> findByinvoiceId(int id);
}
