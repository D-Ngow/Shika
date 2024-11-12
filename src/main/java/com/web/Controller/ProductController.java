package com.web.Controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import com.web.DAO.productsDAO;
import com.web.Entity.Products;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {
	@Autowired
	productsDAO proDAO;
	@Autowired
	HttpServletRequest req;

	@GetMapping("product")
	public String getProduct(Model model, @RequestParam(value = "brand", required = false) List<String> brands,
			@RequestParam(value = "color", required = false) List<String> colors,
			@RequestParam(value = "price", required = false) String price) {
		String cateId = req.getParameter("cateId");
		if (cateId != null && !cateId.isEmpty()) {
			List<Products> listpro = proDAO.findProductsByCategoryId(cateId);
			model.addAttribute("proList",listpro);
		}
		else if(price==null) {
			List<Products> proList = proDAO.findByBrandAndColor(brands, colors);
			model.addAttribute("proList", proList);
		}else {
			Sort sort = price.equals("0") ? Sort.by(Sort.Order.asc("price")) : Sort.by(Sort.Order.desc("price"));
			List<Products> proList = proDAO.findByBrandInAndColorIn(brands, colors, sort);
			model.addAttribute("proList", proList);
		}
		List<String> listbrand = proDAO.findBybrand();
		model.addAttribute("listbrand", listbrand);
		List<String> listcolor = proDAO.findBycolor();
		model.addAttribute("listcolor", listcolor);
		return "product";
	}
	
//	@GetMapping("/product/{catename}")
//	public String getMethodName(@PathVariable String catename,Model model) {
//		List<Products> listpro = proDAO.findProductsByCategoryName(catename);
//		model.addAttribute("proList",listpro);
//		return "product";
//	}
	

	@PostMapping("/search")
	public String search(Model model) {
		List<Products> proSearch = proDAO.findByNameContaining("%" + req.getParameter("search") + "%");
		model.addAttribute("proList", proSearch);
		List<String> listbrand = proDAO.findBybrand();
		model.addAttribute("listbrand", listbrand);
		List<String> listcolor = proDAO.findBycolor();
		model.addAttribute("listcolor", listcolor);
		return "product";
	}

//	@PostMapping("/filter-products")
//	public String filterProducts(@RequestParam(value = "brand", required = false) List<String> brands,
//			@RequestParam(value = "color", required = false) List<String> colors, Model model) {
//
//		System.out.println("Selected Brands: " + brands);
//		System.out.println("Selected Colors: " + colors);
//
//		if (brands == null) {
//			brands = List.of(); 
//		}
//		if (colors == null) {
//			colors = List.of(); 
//		}
//		List<Products> prolist = proDAO.findByBrandAndColor(brands, colors);
//		for (Products p : prolist) {
//			System.out.println(p.getProductName());
//		}
//		model.addAttribute("proList", prolist);
//		return "product";
//	}

}
