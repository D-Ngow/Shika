package com.web.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.Entity.Categories;
import com.web.Entity.CategoryDetails;

public interface categoriesDAO extends JpaRepository<Categories,Integer>{
	Categories findById(int id);
}
