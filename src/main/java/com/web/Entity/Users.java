package com.web.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

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
     List<ShippingAddress> shippingAddresses;

}
