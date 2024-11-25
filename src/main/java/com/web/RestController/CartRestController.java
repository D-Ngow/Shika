package com.web.RestController;

import org.springframework.web.bind.annotation.RestController;

import com.web.DAO.cartsDAO;
import com.web.DTO.CartDTO;
import com.web.Entity.Cart;

import jakarta.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;




@RestController
public class CartRestController {
	
	@Autowired
	cartsDAO cDAO;
	@Autowired
    private HttpSession session;
	
	@PostMapping("/cart/saveSelectedProducts")
    public void saveSelectedProducts(@RequestBody List<CartDTO> selectedProducts) {
		List<Cart> listCheckout = new ArrayList<>();
		for (CartDTO cDTO : selectedProducts) {
			try {
				Cart c = cDAO.findByCartId(cDTO.getCartId());
				listCheckout.add(c);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        session.setAttribute(auth.getName(), listCheckout);
    }
	
	@GetMapping("/cart/getSelectedProducts")
	public List<Cart> getSelectedProducts(HttpSession session) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    return (List<Cart>) session.getAttribute(auth.getName());
	}
	
	@GetMapping("/cart/findAll")
	public List<CartDTO> getDiscount() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		List<Cart> listCart = cDAO.findByEmail(auth.getName());
		return listCart.stream().map(cart -> {
			CartDTO dto = new CartDTO();
			dto.setCartId(cart.getCartId());
            dto.setProductName(cart.getDetail().getProduct().getProductName());
            dto.setBrand(cart.getDetail().getProduct().getBrand());
            dto.setColor(cart.getDetail().getProduct().getColor());
            dto.setSize(cart.getDetail().getType().getSize());
            dto.setQuantity(cart.getQuantity());
            dto.setPrice(cart.getDetail().getProduct().getPrice());
            dto.setImage(cart.getDetail().getProduct().getImage());
            dto.setSubtotal(cart.getQuantity()*cart.getDetail().getProduct().getPrice());
            dto.setDiscount(cart.getQuantity()*cart.getDetail().getProduct().getDiscountPrice());
            return dto;
        }).collect(Collectors.toList());
	}
	
	@PutMapping("/cart/changeQuantity/{id}/{quantity}")
	public void putMethodName(@PathVariable int id,@PathVariable int quantity) {
		Cart cart = cDAO.findByCartId(id);
		cart.setQuantity(quantity);
		cDAO.save(cart);
	}
	
	@DeleteMapping("/cart/deleteCart/{id}")
	public void postMethodName(@PathVariable int id) {
		cDAO.deleteById(id);
	}
	
}
