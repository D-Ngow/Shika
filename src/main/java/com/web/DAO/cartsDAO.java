package com.web.DAO;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.web.Entity.Cart;

public interface cartsDAO extends JpaRepository<Cart,Integer>{
	@Query("SELECT c FROM Cart c WHERE c.user.email LIKE :email")
    List<Cart> findByEmail(String email);
	Cart findByCartId(int cartId);
	@Query("SELECT c FROM Cart c WHERE c.user.userId = :userId AND c.detail.detailId = :detailId")
	Cart findInCart(@Param("userId") int userId, @Param("detailId") int detailId);
//    List<Cart> findAllById(List<Integer> cartIds);
}
