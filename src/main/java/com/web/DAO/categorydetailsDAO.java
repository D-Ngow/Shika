package com.web.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.web.Entity.CategoryDetails;
import com.web.Entity.Products;

public interface categorydetailsDAO extends JpaRepository<CategoryDetails, Integer>{
	@Query("SELECT c.product FROM CategoryDetails c WHERE c.category.categorieId =:id")
	List<Products> findProductByCategoryDetailId(int id);
}
