package com.web.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.Entity.Cart;

public interface cartsDAO extends JpaRepository<Cart,Integer>{

}
