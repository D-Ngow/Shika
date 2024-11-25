package com.web.Controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.web.DAO.categoriesDAO;
import com.web.DAO.invoiceDetailsDAO;
import com.web.DAO.productsDAO;
import com.web.Entity.Categories;
import com.web.Entity.Products;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@Autowired
	productsDAO prdDAO;
	@Autowired
	invoiceDetailsDAO ivdtDAO;
	@Autowired
	categoriesDAO cateDAO;
	@GetMapping("/home")
	public String getHome(Model model) {
		List<Products> listprd = prdDAO.findAll();
		model.addAttribute("listprd",listprd);
		List<Products> listbestproc = ivdtDAO.findBestSellingProducts();
		List<Products> listbestproc2 = listbestproc.subList(0,Math.min(2,listbestproc.size()));
		model.addAttribute("listbestproc",listbestproc2);
		List<Categories> listcate1 = cateDAO.findAll();
		List<Categories> listcate = listcate1.subList(0,Math.min(6,listcate1.size()));
		model.addAttribute("listcate1",listcate);
		return "index";
	}

}
