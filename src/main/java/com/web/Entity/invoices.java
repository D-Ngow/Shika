package com.web.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Entity
@Table(name = "invoices")
@Data @NoArgsConstructor @AllArgsConstructor
public class invoices {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     int invoiceId;
    
    @ManyToOne
    @JoinColumn(name = "userId", nullable = false)
     users user;
    
     Date createDate = new Date();

     double total;
    
     Boolean status;

    @OneToMany(mappedBy = "invoice")
     List<invoiceDetails> invoiceDetails;

}
