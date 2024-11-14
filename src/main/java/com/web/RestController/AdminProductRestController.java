package com.web.RestController;

import java.io.File;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.web.Entity.Products;
import com.web.Service.ProductService;
import com.web.Service.UploadService;

import org.springframework.web.multipart.MultipartFile;

@RestController
@CrossOrigin("*")
@RequestMapping("/manager/product")
public class AdminProductRestController 
{
	
	@Autowired
	private ProductService productService;
	@Autowired
	UploadService uploadService;
	
	@GetMapping("/findall")
	public List<Products> getAllProduct() {
		List<Products> products = productService.findAll();
		return products;
	}

	@GetMapping("/{id}")
	public Products getProductByID(@PathVariable int id) {

		Products products = productService.findById(id);

		return products;
	}

	@PutMapping()
	public Products updateProduct(@RequestBody Products product,@RequestParam("productimage")MultipartFile productimage) {

		Products updateProduct = product;
		try {
            if (!productimage.isEmpty()) {
                File imagePath = uploadService.save(productimage, "/image/product/");
                updateProduct.setImage(imagePath.getName());
            }
            else {
            	Products pd = productService.findById(updateProduct.getProductId());
            	updateProduct.setImage(pd.getImage());
            }
//            if (!largeImageFile.isEmpty()) {
//                File largeImagePath = uploadService.save(largeImageFile, "/image/Product/");
//                prd.setLargeImageUrl("/image/Product/"+largeImagePath.getName());
//            }
//            else {
//            	Product pd = proDAO.findByProductId(Integer.parseInt(req.getParameter("id")));
//            	prd.setLargeImageUrl(pd.getLargeImageUrl());
//            }
        } catch (Exception e) {
            e.printStackTrace();
        }
		productService.updateProduct(product);
		return updateProduct;
	}

	@PostMapping()
	public Products createProduct(@RequestBody Products product,@RequestParam("productimage")MultipartFile productimage) 
	{
		Products createProduct = productService.create(product);
		 try {
	            if (!productimage.isEmpty()) {
	                File imagePath = uploadService.save(productimage, "/image/product/");
	                createProduct.setImage(imagePath.getName());
	            }
	            else {
	            	Products pd = productService.findById(createProduct.getProductId());
	            	createProduct.setImage(pd.getImage());
	            }
//	            if (!largeImageFile.isEmpty()) {
//	                File largeImagePath = uploadService.save(largeImageFile, "/image/Product/");
//	                prd.setLargeImageUrl("/image/Product/"+largeImagePath.getName());
//	            }
//	            else {
//	            	Product pd = proDAO.findByProductId(Integer.parseInt(req.getParameter("id")));
//	            	prd.setLargeImageUrl(pd.getLargeImageUrl());
//	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
		return createProduct;
	}

	@DeleteMapping("/{id}")
	public String deleteProductByID(@PathVariable int id) {

		productService.deleteProduct(id);

		return "Delete is successfully ! ";
	}
	
}
