package com.web.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "users")
@Data @NoArgsConstructor @AllArgsConstructor
public class Users {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     int userId;
    
     String name;

     String email;

     String phoneNumber;

     String password;

     Date birthday;
    
     Boolean gender;
    
     Boolean role;

    @OneToMany(mappedBy = "user")
    @JsonManagedReference(value = "user-shippingAddress")
     List<ShippingAddress> shippingAddresses;

}
