package com.web.Entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "users")
@Data @NoArgsConstructor @AllArgsConstructor
public class Users {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     int userId;
    
	 @NotEmpty(message = "{NotEmpty.us.name}")
     String name;

	 @NotBlank(message = "{NotBlank.us.email}")
	 @Email(message = "{Email.us.email}")
     String email;

	 @Pattern(regexp = "\\d{10}", message = "{Min.us.phoneNumber}")
     String phoneNumber;

	 @NotEmpty(message = "{NotEmpty.us.password}")
     String password;
// <<<<<<< Dao

// 	 LocalDate birthday;
// =======
     
     @DateTimeFormat(pattern = "yyyy-MM-dd")
     Date birthday;

    
     @NotNull(message = "{NotNull.us.gender}")
     Boolean gender;
    
     Boolean role;

    @OneToMany(mappedBy = "user")
    @JsonManagedReference(value = "user-shippingAddress")
     List<ShippingAddress> shippingAddresses;

}
