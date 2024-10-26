package com.web.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.DAO.detailsDAO;
import com.web.DAO.productImageDAO;
import com.web.DAO.productsDAO;
import com.web.DAO.typeDAO;
import com.web.Entity.Details;
import com.web.Entity.ProductImage;
import com.web.Entity.Products;
import com.web.Entity.Type;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;


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
	
}
