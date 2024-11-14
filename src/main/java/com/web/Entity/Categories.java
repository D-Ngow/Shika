package com.web.Entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Table(name = "categories")
@Data @NoArgsConstructor @AllArgsConstructor
public class Categories {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     int categorieId;

     String name;

     String image;

    @OneToMany(mappedBy = "category", cascade = CascadeType.ALL)
    @JsonIgnore
     List<CategoryDetails> categoryDetails;

}


