package com.web.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "details")
@Data @NoArgsConstructor @AllArgsConstructor
public class details {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     int detailId;
    
    @ManyToOne
    @JoinColumn(name = "typeId", nullable = false)
     type type;
    
    @ManyToOne
    @JoinColumn(name = "productId", nullable = false)
     products product;

}
