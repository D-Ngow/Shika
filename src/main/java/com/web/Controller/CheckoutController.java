package com.web.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.DAO.cartsDAO;
import com.web.DAO.paymentDAO;
import com.web.DAO.usersDAO;
import com.web.Entity.Cart;
import com.web.Entity.Payment;
import com.web.Entity.Users;
import com.web.Service.OderService;

import jakarta.servlet.http.HttpServletRequest;


@Controller
public class CheckoutController {
	@Autowired
	usersDAO userDAO;
	@Autowired
	cartsDAO cartDAO;
	@Autowired
	paymentDAO payDAO;
	@Autowired
	HttpServletRequest req;
	@Autowired
	OderService oderservice;
	
	@GetMapping("/checkout")
	public String checkout(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Users user = userDAO.findByEmail(auth.getName());
		List<Cart> listCart = cartDAO.findByEmail(user.getEmail());
		List<Payment> payment = payDAO.findAll();
		try {
			if (listCart.isEmpty()) {
				throw new NullPointerException();
			}
		} catch (Exception e) {
			e.printStackTrace();
			String mess = "No product in cart!";
			return "redirect:/cart?message="+mess;
		}
		model.addAttribute("listPayment", payment);
		model.addAttribute("listCart", listCart);
		model.addAttribute("user", user);
		return "checkout";
	}
	
	@PostMapping("/genInvoice")
	public String genInvoice(@RequestParam String address, @RequestParam int payment) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Users user = userDAO.findByEmail(auth.getName());
		switch (payment) {
		case 1:
			req.getSession().setAttribute("address", address);
			req.getSession().setAttribute("payment", payment);
			return "redirect:/payment";
		case 2:
			oderservice.checkout(user.getEmail(),true, address, payment);
			return "redirect:/buyhistory";
		}
		return "redirect:/checkout";
	}
	
	
	@GetMapping("/queue")
	public String getMethodName(@RequestParam(value = "vnp_ResponseCode") String status) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Users user = userDAO.findByEmail(auth.getName());
		boolean stt = false;
		if(status.equals("00")) {
			stt = true;
 		}
		try {
			String address = String.valueOf(req.getSession().getAttribute("address"));
			int payment = (int) req.getSession().getAttribute("payment");
			oderservice.checkout(user.getEmail(), stt, address, payment);
		} catch (Exception e) {
			System.out.println(e);
			return "redirect:/checkout";
		}
		return "redirect:/buyhistory";
	}
}
