package com.web.RestController;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.web.Entity.Products;
import com.web.Service.ProductService;

@RestController
@RequestMapping("/manager/product")
public class AdminProductRestController 
{
	
	@Autowired
	private ProductService productService;

	@GetMapping("/findAll")
	public List<Products> getAllProduct() {
		System.out.println("be find all");
		List<Products> products = productService.findAll();
		System.out.println("length: " +products.size());
		return products;
	}

	@GetMapping("/{id}")
	public Products getProductByID(@PathVariable int id) {

		Products products = productService.findById(id);

		return products;
	}

	@PutMapping()
	public Products updateProduct(@RequestBody Products product) {
		System.out.println("edit: " +product);
		Products updateProduct = productService.updateProduct(product);

		return updateProduct;
	}

	@PostMapping()
	public Products createProduct(@RequestBody Products product) 
	{
		System.out.println("a: " +product);		
		Products createProduct = productService.create(product);
		return createProduct;
	}

	@DeleteMapping("/{id}")
	public String deleteProductByID(@PathVariable int id) {

		productService.deleteProduct(id);

		return "Delete is successfully ! ";
	}
	
}
