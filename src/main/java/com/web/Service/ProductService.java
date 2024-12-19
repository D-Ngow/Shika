package com.web.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.DAO.productImageDAO;
import com.web.DAO.productsDAO;
import com.web.Entity.ProductImage;
import com.web.Entity.Products;

@Service
public class ProductService {

	@Autowired
	private productsDAO proDao;
	@Autowired
	productImageDAO imgDAO;

	public Products create(Products product) {
		Products savedProduct = proDao.save(product);
		return savedProduct;
	}
	
	public void saveProduct(Products product) {
		proDao.save(product);
	}
	
	public void saveSubImage (Products pro, String name) {
		ProductImage proImg = new ProductImage();
		proImg.setImageUrl(name);
		proImg.setProduct(pro);
		imgDAO.save(proImg);
	}
	
	public Products findById(int id) {
		Products product = proDao.findById(id);
		if(product==null) {
			return null;
		}
		return product;
	}

	public List<Products> findAll(){
		List<Products> products = proDao.findAll();
		return products;
	}

	public Products updateProduct(Products product) {
		Products savedProduct = findById(product.getProductId());

		savedProduct.setProductName(product.getProductName());
		savedProduct.setStatus(product.getStatus());
		savedProduct.setQuantity(product.getQuantity());
		savedProduct.setPrice(product.getPrice());
		savedProduct.setImages(product.getImages());
		savedProduct.setDiscountPrice(product.getDiscountPrice());
		savedProduct.setDescribe(product.getDescribe());
		savedProduct.setColor(product.getColor());
		savedProduct.setBrand(product.getBrand());

		return proDao.save(savedProduct);
	}

	public void deleteProduct(int id) {
		proDao.deleteById(id);
	}

}
