package com.web.RestController;

import org.springframework.web.bind.annotation.RestController;

import com.web.DAO.cartsDAO;
import com.web.Entity.Cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;


@RestController
public class CartRestController {
	
	@Autowired
	cartsDAO cDAO;
	
	
	@GetMapping("/rest/cart/findAll")
	public List<Cart> getDiscount() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		List<Cart> listCart = cDAO.findByEmail(auth.getName());
		return listCart;
	}
	
}
