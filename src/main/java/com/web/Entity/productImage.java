package com.web.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "productImage")
@Data @AllArgsConstructor @NoArgsConstructor
public class productImage {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     int imageId;

    @ManyToOne
    @JoinColumn(name = "productId")
     products product;
    
     String imageUrl;


}

