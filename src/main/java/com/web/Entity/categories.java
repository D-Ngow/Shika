package com.web.Entity;

import java.util.List;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Table(name = "categories")
@Data @NoArgsConstructor @AllArgsConstructor
public class categories {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     int categorieId;

     String name;

     String image;

    @OneToMany(mappedBy = "category", cascade = CascadeType.ALL)
     List<categorydetails> categoryDetails;

}


