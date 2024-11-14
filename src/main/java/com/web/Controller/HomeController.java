package com.web.Controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import com.web.DAO.invoiceDetailsDAO;
import com.web.DAO.productsDAO;
import com.web.Entity.Products;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@Autowired
	productsDAO prdDAO;
	@Autowired
	invoiceDetailsDAO ivdtDAO;

	@GetMapping("/home")
	public String getHome(Model model) {
		List<Products> listprd = prdDAO.findAll();
		model.addAttribute("listprd",listprd);
		List<Products> listbestproc = ivdtDAO.findBestSellingProducts();
		List<Products> listbestproc2 = listbestproc.subList(0,Math.min(2,listbestproc.size()));
		model.addAttribute("listbestproc",listbestproc2);

		return "index";
	}

}
