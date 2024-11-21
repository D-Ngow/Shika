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
import com.web.Service.UploadService;

import java.io.File;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;


@RestController
@RequestMapping("/manager/category")
public class AdminCategoryRestController {
	@Autowired
	categoriesDAO cateDAO;
	@Autowired
	categorydetailsDAO cdDAO;
	@Autowired
	productsDAO proDAO;
	@Autowired
	UploadService uploadService;
	@GetMapping("/findAll")
	public List<Categories> findAll() {
		List<Categories> cateList = cateDAO.findAll();
		return cateList;
	}
	
	@DeleteMapping("/deletePro/{cateId}/{proId}")
	public void deletePro(@PathVariable int cateId, @PathVariable int proId) {
		cdDAO.deleteProductByCategoryIdAndProductId(cateId, proId);
	}
	
	@DeleteMapping("/deleteCate/{cateId}")
	public void deletecategory(@PathVariable int cateId) {
		cateDAO.deleteById(cateId);
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
	
	@PostMapping(value = "/addCate", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public void addcate(@RequestParam(value="name") String name,
						@RequestParam(value ="image") MultipartFile image){
			Categories cate = new Categories();
			try {
				cate.setName(name);
				if (image != null && !image.isEmpty()) {
		            File imagePath = uploadService.save(image, "/image/category/");
		            cate.setImage(imagePath.getName());
		        }
		        else {
		        	throw new NullPointerException("Can Find Image");
		        }
				cateDAO.save(cate);
			} catch (Exception e) {
				System.out.println(e);
			}
			
	}
	
}
