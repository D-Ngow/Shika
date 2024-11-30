package com.web.DAO;

import java.util.List;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.web.Entity.Invoices;

public interface invoicesDAO extends JpaRepository<Invoices,Integer>{
	@Query("SELECT i FROM Invoices i WHERE i.user.userId =:id")
    List<Invoices> findByuserid(int id);
	@Query("SELECT i FROM Invoices i WHERE i.status = :status")
    List<Invoices> findInvoicesByStatus(@Param("status") int status,Sort sort);
	List<Invoices> findAll(Sort sort);
	Invoices findByInvoiceId(int invoiceId);
}
