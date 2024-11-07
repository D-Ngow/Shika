package com.web.RestController;

import org.springframework.web.bind.annotation.RestController;

import com.web.DAO.cartsDAO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;


@RestController
public class CartRestController {
	
	@Autowired
	cartsDAO cDAO;
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	
	@GetMapping("/rest/cart")
	public List<Float> getDiscount() {
		List<Float> listDiscount = cDAO.findDiscountByUsername(auth.getName());
		return listDiscount;
	}
	
}
