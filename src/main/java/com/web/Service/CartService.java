package com.web.Service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.web.DAO.cartsDAO;
import com.web.Entity.Cart;

@Service
public class CartService {
	@Autowired
	cartsDAO cartDAO;
	
	public List<Cart> FindByName(String name) {
		List<Cart> list = cartDAO.findByUsername(name);
		return list;
	}
}
