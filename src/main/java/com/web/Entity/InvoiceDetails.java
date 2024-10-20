package com.web.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "invoiceDetails")
@Data @NoArgsConstructor @AllArgsConstructor
public class InvoiceDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     int invoiceDetailId;
    
    @ManyToOne
    @JoinColumn(name = "invoiceId", nullable = false)
     Invoices invoice;
    
    @ManyToOne
    @JoinColumn(name = "detailsId", nullable = false)
     Details detail;

     int quantity;

     double price;

}
