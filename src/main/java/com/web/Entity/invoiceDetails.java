package com.web.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "invoiceDetails")
@Data @NoArgsConstructor @AllArgsConstructor
public class invoiceDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     int invoiceDetailId;
    
    @ManyToOne
    @JoinColumn(name = "invoiceId", nullable = false)
     invoices invoice;
    
    @ManyToOne
    @JoinColumn(name = "detailsId", nullable = false)
     details detail;

     int quantity;

     double price;

}
