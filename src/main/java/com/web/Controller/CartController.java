package com.web.Controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.web.DAO.cartsDAO;
import com.web.DAO.detailsDAO;
import com.web.DAO.usersDAO;
import com.web.Entity.Cart;
import com.web.Entity.Details;
import com.web.Entity.Users;
import com.web.Service.OderService;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class CartController {
	@Autowired
	cartsDAO cartDAO;
	@Autowired
	detailsDAO detailDAO;
	@Autowired
	HttpServletRequest req;
	@Autowired
	usersDAO userDAO;
	@Autowired
	OderService oderservice;
	@GetMapping("/cart")
	public String cart(Model model) {
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		Users user = userDAO.findByEmail(auth.getName());
//		
//		List<Cart> listCart = cartDAO.findByname(user.getName());
//		List<Details> listDetail = detailDAO.findAll();
//		model.addAttribute("listCart", listCart);
//		model.addAttribute("listDetail", listDetail);
//		double subtotal =0, discount=0, total=0;
//		for (Cart c : listCart) {
//			subtotal += c.getDetail().getProduct().getPrice() * c.getQuantity();
//			if (!c.getDetail().getProduct().getDiscountPrice().equals(null)) {
//				discount += c.getDetail().getProduct().getDiscountPrice();
//			}
//			else {
//				discount += 0;
//			}
//		}
//		total = subtotal - discount;
//		model.addAttribute("subtotal", subtotal);
//		model.addAttribute("discount", discount);
//		model.addAttribute("total", total);
		return "cart";
	}
	@GetMapping("/checkout")
	public String getMethodName(@RequestParam(value = "vnp_ResponseCode") String status) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Users user = userDAO.findByEmail(auth.getName());
		boolean stt = false;
		if(status.equals("00")) {
		stt = true;
 		}
		try {
			oderservice.checkout(user.getEmail(),stt);
		} catch (Exception e) {
			System.out.println(e);
			return "redirect:/cart";
		}
		return "redirect:/buyhistory";
	}
		
	
//	@GetMapping("/changeQuantity")
//	public String changeQuantity() {
//		String method = req.getParameter("method");
//		int id = Integer.parseInt(req.getParameter("id"));
//		List<Cart> listCart = cartDAO.findAll();
//		for (Cart c : listCart) {
//			if (id == c.getDetail().getProduct().getProductId()) {
//				int quantity = c.getQuantity();
//				if (method.equals("decrease")) {
//					c.setQuantity(quantity-1);
//					cartDAO.save(c);
//				}
//				else if (method.equals("increase")) {
//					c.setQuantity(quantity+1);
//					cartDAO.save(c);
//				}
//			}
//		}
//		return "redirect:/cart";
//	}
	
}
