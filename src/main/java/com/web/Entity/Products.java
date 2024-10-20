package com.web.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@Table(name = "products")
@Data @AllArgsConstructor @NoArgsConstructor
public class Products {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     int productId;
    
     String productName;
    
     String color;

     int quantity;
    
     double price;
    
     Float discountPrice;
    
     Boolean status;
    
     String brand;
     
     String image;
    
     String describe;

    @OneToMany(mappedBy = "product")
     List<ProductImage> images;

}

