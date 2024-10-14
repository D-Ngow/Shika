package com.web.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.Entity.products;

public interface productsDAO extends JpaRepository<products, Integer>{

}
