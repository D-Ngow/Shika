package com.web.RestController;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.web.DAO.detailsDAO;
import com.web.DAO.productsDAO;
import com.web.DAO.typeDAO;
import com.web.DTO.ProductDTO;
import com.web.Entity.Details;
import com.web.Entity.Products;
import com.web.Entity.Type;

@RestController
@RequestMapping("/manager/size")
public class AdminSizeRestController {
	@Autowired
	productsDAO proDAO;
	@Autowired
	detailsDAO dDAO;
	@Autowired
	typeDAO tDAO;
	
	@GetMapping("/findAll")
	public List<ProductDTO> findAllProducts() {
	    List<Products> products = proDAO.findAll();
	    return products.stream().map(product -> {
	        List<Integer> sizes = dDAO.findSizeByProductId(product.getProductId());
	        ProductDTO proDTO = new ProductDTO();
	        proDTO.setImage(product.getImage());
	        proDTO.setProductId(product.getProductId());
	        proDTO.setProductName(product.getProductName());
	        proDTO.setSizes(sizes);
	        return proDTO;
	    }).collect(Collectors.toList());
	}
	
	@DeleteMapping("/remove")
	public void removeSizeFromProduct(@RequestParam int productId, @RequestParam int size) {
	    // Tìm sản phẩm và loại size
	    Products product = proDAO.findById(productId);
	    Type type = tDAO.findBySize(size);

	    if (type == null) {
	        return;
	    }

	    // Xóa size khỏi sản phẩm
	    Details detail = dDAO.findDetailByProductAndType(product, type);
	    if (detail != null) {
	    	dDAO.delete(detail);
	    }
	}
	
	@PostMapping("/add")
	public void addSizeToProduct(@RequestParam int productId, @RequestParam int size) {
	    // Tìm sản phẩm
	    Products product = proDAO.findById(productId);

	    // Tìm hoặc tạo type (size)
	    Type type = tDAO.findBySize(size);
	    if (type == null) {
	        type = new Type();
	        type.setSize(size);
	        tDAO.save(type);
	    }

	    // Thêm size vào sản phẩm
	    Details detail = new Details();
	    detail.setProduct(product);
	    detail.setType(type);
	    dDAO.save(detail);
	}

}
