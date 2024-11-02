package com.web.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.DAO.productsDAO;
import com.web.Entity.Products;

@Service
public class ProductService {

	@Autowired
	private productsDAO proDao;

	public Products create(Products product) {
		Products savedProduct = proDao.save(product);
		return savedProduct;
	}

	public Products findById(int id) {
		Optional<Products> product = proDao.findById(id);
		if(product.isEmpty()) {
			return null;
		}
		return product.get();
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
		Products product = findById(id);
		proDao.deleteById(id);

	}

}
