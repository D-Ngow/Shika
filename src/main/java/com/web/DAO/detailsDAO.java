package com.web.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.web.Entity.Details;


public interface detailsDAO extends JpaRepository<Details,Integer>{
	@Query("SELECT d FROM Details d WHERE d.product.productId =:id")
    List<Details> findByProductId(int id);
}
