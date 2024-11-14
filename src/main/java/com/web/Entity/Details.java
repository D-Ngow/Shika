package com.web.Entity;

import com.fasterxml.jackson.annotation.JsonBackReference;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "details")
@Data @NoArgsConstructor @AllArgsConstructor
public class Details {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     int detailId;
    
    @ManyToOne
    @JoinColumn(name = "typeId", nullable = false)
    @JsonBackReference(value = "type-details")
     Type type;
    
    @ManyToOne
    @JoinColumn(name = "productId", nullable = false)
    @JsonBackReference(value = "product-details")
     Products product;

}
