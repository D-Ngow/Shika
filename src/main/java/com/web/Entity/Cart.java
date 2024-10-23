package com.web.Entity;

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
     Users user;
    
    @ManyToOne
    @JoinColumn(name = "detailId", nullable = false)
     Details detail;
    
     int quantity;

}

