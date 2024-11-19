package com.web.RestController;

import java.io.File;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
public class AdminProductRestController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	UploadService uploadService;
	
	@GetMapping("/findall")
	public List<Products> getAllProduct() {
		List<Products> products = productService.findAll();
		return products;
	}

	@PostMapping(value = "/update", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public void updateProduct(@RequestParam("productId") int productId,
				            @RequestParam("productName") String productName,
				            @RequestParam("color") String color,
				            @RequestParam("quantity") int quantity,
				            @RequestParam("price") double price,
				            @RequestParam("discountPrice") float discountPrice,
				            @RequestParam("status") boolean status,
				            @RequestParam("brand") String brand,
				            @RequestParam("describe") String describe,
				            @RequestParam(value = "imgFile", required = false) MultipartFile imgFile) {
	    try {
	    	Products product = productService.findById(productId);
	        product.setProductName(productName);
	        product.setColor(color);
	        product.setQuantity(quantity);
	        product.setPrice(price);
	        product.setDiscountPrice(discountPrice);
	        product.setStatus(status);
	        product.setBrand(brand);
	        product.setDescribe(describe);
	        // Kiểm tra nếu có tệp hình ảnh mới
	        if (imgFile != null && !imgFile.isEmpty()) {
	            // Lưu hình ảnh mới và lấy tên của tệp
	            File imagePath = uploadService.save(imgFile, "/image/product/");
	            product.setImage(imagePath.getName()); // Cập nhật hình ảnh cho sản phẩm
	        }
	        else {
	        	Products pro = productService.findById(product.getProductId());
	        	pro.setImage(pro.getImage());
	        }
	     // Lưu thông tin sản phẩm cập nhật vào cơ sở dữ liệu
		    productService.saveProduct(product);
	    } catch (Exception e) {
	        e.printStackTrace(); // In ra lỗi nếu có
	    }
	}


	@PostMapping(value = "/add", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public void addProduct(@RequestParam("productName") String productName,
				            @RequestParam("color") String color,
				            @RequestParam("quantity") int quantity,
				            @RequestParam("price") double price,
				            @RequestParam("discountPrice") float discountPrice,
				            @RequestParam("status") boolean status,
				            @RequestParam("brand") String brand,
				            @RequestParam("describe") String describe,
				            @RequestParam(value = "imgFile", required = false) MultipartFile imgFile) {
	    try {
	    	Products product = new Products();
	        product.setProductName(productName);
	        product.setColor(color);
	        product.setQuantity(quantity);
	        product.setPrice(price);
	        product.setDiscountPrice(discountPrice);
	        product.setStatus(status);
	        product.setBrand(brand);
	        product.setDescribe(describe);

	        File imagePath = uploadService.save(imgFile, "/image/product/");
            product.setImage(imagePath.getName());
            
		    productService.saveProduct(product);
	    } catch (Exception e) {
	        e.printStackTrace(); // In ra lỗi nếu có
	    }
	}

	@DeleteMapping("/delete/{id}")
	public void deleteProductByID(@PathVariable int id) {
		try {
			productService.deleteProduct(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
