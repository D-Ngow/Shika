package com.web.Controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import com.web.DAO.categoriesDAO;
import com.web.DAO.productsDAO;
import com.web.Entity.categories;
import com.web.Entity.products;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@Autowired
	productsDAO prdDAO;
	@Autowired
	categoriesDAO cateDAO;
	@GetMapping("/home")
	public String getHome(Model model) {
		List<products> listprd = prdDAO.findAll();
		model.addAttribute("listprd",listprd);
		List<categories> listcate = cateDAO.findAll();
		model.addAttribute("listcate",listcate);
		return "";
	}
}
