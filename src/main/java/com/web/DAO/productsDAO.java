package com.web.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.Entity.Products;

public interface productsDAO extends JpaRepository<Products, Integer>{

}
