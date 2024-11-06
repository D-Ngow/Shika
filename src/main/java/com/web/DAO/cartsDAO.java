package com.web.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.web.Entity.Cart;

public interface cartsDAO extends JpaRepository<Cart,Integer>{
	@Query("SELECT c FROM Cart c WHERE c.user.name =:name")
    List<Cart> findByUsername(String name);
}
