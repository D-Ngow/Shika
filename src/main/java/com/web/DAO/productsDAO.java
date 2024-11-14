package com.web.DAO;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.web.Entity.Products;

public interface productsDAO extends JpaRepository<Products, Integer> {
	@Query("SELECT p FROM Products p WHERE :name IS NULL OR p.productName LIKE %:name%")
	List<Products> findByNameContaining(@Param("name") String name);
	@Query("SELECT p FROM Products p WHERE (:brand IS NULL OR p.brand IN :brand) AND (:color IS NULL OR p.color IN :color)")
	List<Products> findByBrandAndColor(@Param("brand") List<String> brands, @Param("color") List<String> colors);
	@Query("SELECT p FROM Products p WHERE (:brand IS NULL OR p.brand IN :brand) AND (:color IS NULL OR p.color IN :color)")
    List<Products> findByBrandInAndColorIn(@Param("brand") List<String> brands, @Param("color") List<String> colors, Sort sort);
    @Query(value = "SELECT i.detail.product FROM InvoiceDetails i GROUP BY i.detail.product.productId ORDER BY SUM(i.quantity) DESC")
    List<Products> findTop2BestSellingProducts();
    @Query("SELECT p FROM Products p ORDER BY p.price ASC") 
    List<Products> findAllSortedByPriceAsc();
    @Query("SELECT p FROM Products p ORDER BY p.price DESC")
    List<Products> findAllSortedByPriceDesc();
    @Query("SELECT DISTINCT p.brand FROM Products p")
    List<String> findBybrand();
    @Query("SELECT DISTINCT p.color FROM Products p")
    List<String> findBycolor();
    @Query("SELECT p FROM Products p " +
            "JOIN CategoryDetails cd ON p.productId = cd.product.productId " +
            "JOIN Categories c ON cd.category.categorieId = c.categorieId " +
            "WHERE c.categorieId = :categorieId")
    List<Products> findProductsByCategoryId(@Param("categorieId") String categorieId);
    Products findById(int id);
}
