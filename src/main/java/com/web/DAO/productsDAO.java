package com.web.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.web.Entity.Products;

public interface productsDAO extends JpaRepository<Products, Integer> {
    @Query("SELECT p FROM Products p WHERE p.productName LIKE :name")
    List<Products> findByName(String name);
    @Query(value = "SELECT i.detail.product FROM InvoiceDetails i GROUP BY i.detail.product.productId ORDER BY SUM(i.quantity) DESC")
    List<Products> findTop2BestSellingProducts();

}
