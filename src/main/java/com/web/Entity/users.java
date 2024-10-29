package com.web.Entity;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

import java.util.Date;
import java.util.List;

@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "users")
@Data @NoArgsConstructor @AllArgsConstructor
public class users {

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
     List<shippingAddress> shippingAddresses;

}
