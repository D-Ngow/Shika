package com.web.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.web.Entity.CategoryDetails;
import com.web.Entity.Products;

public interface categorydetailsDAO extends JpaRepository<CategoryDetails, Integer>{
	@Query("SELECT c.product FROM CategoryDetails c WHERE c.category.categorieId =:id")
	List<Products> findProductByCategoryDetailId(int id);
	@Transactional
	@Modifying
	@Query("DELETE FROM CategoryDetails c WHERE c.category.categorieId = :cateId AND c.product.productId = :proId")
	void deleteProductByCategoryIdAndProductId(@Param("cateId") int cateId, @Param("proId") int proId);
}
