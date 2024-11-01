package com.web.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.Entity.Products;
import com.web.Service.ProductService;

@Controller
@RequestMapping("/manager/product")
public class AdminProductController {

	@Autowired
	private ProductService productService;

	@GetMapping()
	public List<Products> selectAllProduct() {
		return productService.findAll();
	}

	@GetMapping("/{id}")
	public Products getProductByID(@PathVariable int id) {

		Products products = productService.findById(id);

		return products;
	}

	@PutMapping()
	public Products updateProduct(@RequestBody Products product) {

		Products updateProduct = productService.updateProduct(product);

		return updateProduct;
	}

	@PostMapping()
	public Products createProduct(@RequestBody Products product) {

		Products createProduct = productService.create(product);
		return createProduct;
	}

	@DeleteMapping("/{id}")
	public String deleteProductByID(@PathVariable int id) {

		productService.deleteProduct(id);

		return "Delete is successfully ! ";
	}

}
