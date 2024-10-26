package com.web.DAO;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.web.Entity.ProductImage;

public interface productImageDAO extends JpaRepository<ProductImage, Integer>{
	@Query("SELECT p FROM ProductImage p WHERE p.product.productId =:id")
    List<ProductImage> findByProductId(int id);
}
