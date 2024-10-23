package com.web.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.DAO.cartsDAO;
import com.web.DAO.detailsDAO;
import com.web.DAO.typeDAO;
import com.web.Entity.Cart;
import com.web.Entity.Details;
import com.web.Entity.Type;

@Controller
public class CartController {
	@Autowired
	cartsDAO cartDAO;
	@Autowired
	detailsDAO detailDAO;
	@Autowired
	typeDAO tDAO;
	
	@GetMapping("/cart")
	public String cart(Model model) {
		List<Cart> listCart = cartDAO.findAll();
		List<Details> listDetail = detailDAO.findAll();
		List<Type> listType = tDAO.findAll();
		model.addAttribute("listCart", listCart);
		model.addAttribute("listDetail", listDetail);
		model.addAttribute("listType", listType);
		double subtotal =0, discount=0, total=0;
		for (Cart c : listCart) {
			subtotal += c.getProduct().getPrice() * c.getQuantity();
			if (!c.getProduct().getDiscountPrice().equals(null)) {
				discount += c.getProduct().getDiscountPrice();
			}
			else {
				discount += 0;
			}
		}
		total = subtotal - (subtotal*discount/100);
		model.addAttribute("subtotal", subtotal);
		model.addAttribute("discount", discount);
		model.addAttribute("total", total);
		return "cart";
	}
	
}
