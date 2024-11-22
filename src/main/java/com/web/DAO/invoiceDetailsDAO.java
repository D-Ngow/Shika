package com.web.DAO;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.web.Entity.InvoiceDetails;
import com.web.Entity.Products;

public interface invoiceDetailsDAO extends JpaRepository<InvoiceDetails,Integer>{
	@Query("SELECT i FROM InvoiceDetails i WHERE i.invoice.invoiceId =:id")
    List<InvoiceDetails> findByinvoiceId(int id);
	@Query("SELECT id.detail.product AS totalQuantitySold " +
	           "FROM InvoiceDetails id " +
	           "GROUP BY id.detail.product " +
	           "ORDER BY totalQuantitySold DESC")
	    List<Products> findBestSellingProducts();
	@Query("SELECT p " +
		       "FROM InvoiceDetails id " +
		       "JOIN id.detail d " +
		       "JOIN d.product p " +
		       "WHERE id.invoice.invoiceId = :invoiceId")
		List<Products> findProductsByInvoiceId(@Param("invoiceId") int invoiceId);

}
