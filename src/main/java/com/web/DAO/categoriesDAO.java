package com.web.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.Entity.Categories;

public interface categoriesDAO extends JpaRepository<Categories,Integer>{

}
