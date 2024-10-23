package com.web.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.web.DAO.productsDAO;
import com.web.Entity.Products;

import jakarta.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;



@Controller
public class ProductController {
	@Autowired
	productsDAO proDAO;
	@Autowired
	HttpServletRequest req;
	
	@GetMapping("product")
	public String getProduct(Model model) {
		List<Products> proList = proDAO.findAll();
		model.addAttribute("proList", proList);
		return "product";
	}
	
	@PostMapping("/search")
	public String search(Model model) {
		List<Products> proSearch = proDAO.findByName("%"+req.getParameter("search")+"%");
		model.addAttribute("proList", proSearch);
		return "product";
	}
		
	
}
