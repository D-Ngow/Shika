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

	@PostMapping(value="/update/{id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public void updateProduct(@ModelAttribute Products pro, @PathVariable int id, @RequestParam("imgFile") MultipartFile imgFile) {
	    pro.setProductId(id); // Đặt ID của sản phẩm

	    try {
	        // Kiểm tra nếu có tệp hình ảnh mới
	        if (!imgFile.isEmpty()) {
	            // Lưu hình ảnh mới và lấy tên của tệp
	            File imagePath = uploadService.save(imgFile, "/image/product/");
	            pro.setImage(imagePath.getName()); // Cập nhật hình ảnh cho sản phẩm
	        } else {
	            // Nếu không có hình ảnh mới, giữ nguyên hình ảnh cũ
	            Products existingProduct = productService.findById(pro.getProductId());
	            pro.setImage(existingProduct.getImage());
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); // In ra lỗi nếu có
	    }

	    // Lưu thông tin sản phẩm cập nhật vào cơ sở dữ liệu
	    productService.saveProduct(pro);
	}


	@PostMapping()
	public Products createProduct(@PathVariable Products pro,@RequestParam("productimage")MultipartFile imgCreate) 
	{
		Products createProduct = productService.create(pro);
		 try {
	            if (!imgCreate.isEmpty()) {
	                File imagePath = uploadService.save(imgCreate, "/image/product/");
	                createProduct.setImage(imagePath.getName());
	            }
	            else {
	            	Products pd = productService.findById(createProduct.getProductId());
	            	createProduct.setImage(pd.getImage());
	            }
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
