package com.web.Entity;

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
    private Users user;
    
    private String address;

	public ShippingAddress(Users user, String address) {
		this.user = user;
		this.address = address;
	}
    
    
}

