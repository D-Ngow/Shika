package com.web.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;
import org.springframework.format.annotation.DateTimeFormat;

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
     
     @DateTimeFormat(pattern = "yyyy-MM-dd")
     Date birthday;
    
     Boolean gender;
    
     Boolean role;

    @OneToMany(mappedBy = "user")
     List<ShippingAddress> shippingAddresses;

}
