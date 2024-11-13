package com.web.Entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "productImage")
@Data @AllArgsConstructor @NoArgsConstructor
public class ProductImage {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     int imageId;

    @ManyToOne
    @JoinColumn(name = "productId")
    @JsonIgnore
     Products product;
    
     String imageUrl;


}

