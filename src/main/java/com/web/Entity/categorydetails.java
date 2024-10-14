package com.web.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "categorydetails")
@Data @NoArgsConstructor  @AllArgsConstructor
public class categorydetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "productId")
    private products product;

    @ManyToOne
    @JoinColumn(name = "categoryId")
    private categories category;

}

