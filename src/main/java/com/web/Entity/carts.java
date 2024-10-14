package com.web.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "carts")
@Data @NoArgsConstructor @AllArgsConstructor
public class carts {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     int cartId;
    
    @ManyToOne
    @JoinColumn(name = "userId", nullable = false)
     users user;
    
    @ManyToOne
    @JoinColumn(name = "productId", nullable = false)
     products product;
    
     int quantity;

}

