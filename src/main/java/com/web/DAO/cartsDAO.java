package com.web.DAO;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.web.Entity.Cart;

public interface cartsDAO extends JpaRepository<Cart,Integer>{
	@Query("SELECT c FROM Cart c WHERE c.user.name LIKE :name")
    List<Cart> findByname(String name);
	@Query("SELECT c.detail.product.discountPrice FROM Cart c WHERE c.user.email LIKE :email")
	List<Float> findDiscountByUsername(String email);
}
