package com.web.Entity;

import com.fasterxml.jackson.annotation.JsonBackReference;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "shippingAddress")
@Data @NoArgsConstructor @AllArgsConstructor
public class ShippingAddress {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int addressId;
    
    @ManyToOne
    @JoinColumn(name = "userId", nullable = false)
    @JsonBackReference(value = "user-shippingAddress")
    private Users user;
    
    private String city;
    private String district;
    private String ward;
    private String road;
    
}

