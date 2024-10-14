package com.web.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "shippingAddress")
@Data @NoArgsConstructor @AllArgsConstructor
public class shippingAddress {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int addressId;
    
    @ManyToOne
    @JoinColumn(name = "userId", nullable = false)
    private users user;
    
    private String address;

}

