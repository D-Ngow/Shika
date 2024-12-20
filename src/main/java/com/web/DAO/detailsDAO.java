package com.web.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.web.Entity.Details;
import com.web.Entity.Products;
import com.web.Entity.Type;


public interface detailsDAO extends JpaRepository<Details,Integer>{
	@Query("SELECT d FROM Details d WHERE d.product.productId =:id")
    List<Details> findByProductId(int id);
	@Query("SELECT d.detailId FROM Details d WHERE d.product.productId =:proId AND d.type.typeId =:typeId")
	int findDetailIdByProductAndType(int proId, int typeId);
	Details findByDetailId(int detailId);
	@Query("SELECT d.type.size FROM Details d WHERE d.product.productId =:proId")
	List<Integer> findSizeByProductId(int proId);
	@Query("SELECT d FROM Details d WHERE d.product =:pro AND d.type =:type")
	Details findDetailByProductAndType(Products pro, Type type);
}
