package com.web.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.DAO.cartsDAO;
import com.web.DAO.detailsDAO;
import com.web.DAO.productImageDAO;
import com.web.DAO.productsDAO;
import com.web.DAO.typeDAO;
import com.web.DAO.usersDAO;
import com.web.Entity.Cart;
import com.web.Entity.Details;
import com.web.Entity.ProductImage;
import com.web.Entity.Products;
import com.web.Entity.Type;
import com.web.Entity.Users;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.RequestBody;



@Controller
public class ProductDeltailsController {
	
	@Autowired
	HttpServletRequest req;
	@Autowired
	productsDAO ProcDAO;
	@Autowired
	productImageDAO procimgDAO;
	@Autowired
	detailsDAO detailsDAO;
	@Autowired
	productsDAO prdDAO;
	@Autowired
	usersDAO uDAO;
	@Autowired
	cartsDAO cDAO;
	@Autowired
	detailsDAO dDAO;
	
	@GetMapping("/details")
	public String getMethodName(Model model) {
		String id = req.getParameter("id");
		Products product = ProcDAO.findById(Integer.parseInt(id)).get();
		model.addAttribute("product",product);
		List<Details> listDetails = detailsDAO.findByProductId(Integer.parseInt(id));
		model.addAttribute("detail",listDetails);
		List<ProductImage> listimg = procimgDAO.findByProductId(Integer.parseInt(id));
		model.addAttribute("image",listimg);
		List<Products> listprd = prdDAO.findAll();
		model.addAttribute("listprd",listprd);
		return "productDetail";
	}
	
	@PostMapping("/addToCart/{id}")
	public String addToCart(@PathVariable int id) {
		int typeId = Integer.parseInt(req.getParameter("sizeSelect"));
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Users user = uDAO.findByEmail(auth.getName());
		Cart cart = cDAO.findInCart(user.getUserId(), dDAO.findDetailIdByProductAndType(id, typeId));
		if (cart==null) {
			cart = new Cart();
			cart.setUser(user);
			cart.setDetail(dDAO.findByDetailId(dDAO.findDetailIdByProductAndType(id, typeId)));
			cart.setQuantity(1);
			cDAO.save(cart);
		}
		else {
			cart.setQuantity(cart.getQuantity()+1);
			cDAO.save(cart);
		}
		return "redirect:/details?id="+id;
	}
	
	
}
