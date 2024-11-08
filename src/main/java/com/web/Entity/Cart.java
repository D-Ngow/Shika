package com.web.Entity;

import com.fasterxml.jackson.annotation.JsonBackReference;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "carts")
@Data @NoArgsConstructor @AllArgsConstructor
public class Cart {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     int cartId;
    
    @ManyToOne
    @JoinColumn(name = "userId", nullable = false)
    @JsonBackReference(value = "user-cart")
     Users user;
    
    @ManyToOne
    @JoinColumn(name = "detailId", nullable = false)
    @JsonBackReference(value = "detail-cart")
     Details detail;
    
     int quantity;

}

