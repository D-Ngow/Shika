package com.web.RestController;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.web.DAO.categoriesDAO;
import com.web.DAO.categorydetailsDAO;
import com.web.DAO.productsDAO;
import com.web.Entity.Categories;
import com.web.Entity.CategoryDetails;
import com.web.Entity.Products;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;



@RestController
@RequestMapping("/manager/category")
public class AdminCategoryRestController {
	@Autowired
	categoriesDAO cateDAO;
	@Autowired
	categorydetailsDAO cdDAO;
	@Autowired
	productsDAO proDAO;
	
	@GetMapping("/findAll")
	public List<Categories> findAll() {
		List<Categories> cateList = cateDAO.findAll();
		return cateList;
	}
	
	@GetMapping("/findAllCateDetail")
	public List<CategoryDetails> findAllCateDetail() {
		List<CategoryDetails> cateList = cdDAO.findAll();
		return cateList;
	}
	
	@GetMapping("/findPro/{id}")
	public List<Products> findPro(@PathVariable int id) {
		List<Products> proList = cdDAO.findProductByCategoryDetailId(id);
		return proList;
	}
	
	@GetMapping("/findAllPro")
	public List<Products> findAllPro() {
		List<Products> proList = proDAO.findAll();
		return proList;
	}
	
	@PostMapping("/addPro/{cateId}/{proId}")
	public boolean addPro(@PathVariable String proId, @PathVariable String cateId) {
		try {
			CategoryDetails cd = new CategoryDetails();
			cd.setCategory(cateDAO.findById(Integer.parseInt(cateId)));
			cd.setProduct(proDAO.findById(Integer.parseInt(proId)));
			cdDAO.save(cd);
			return true;
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}
	
}
