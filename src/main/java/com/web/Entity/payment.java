package com.web.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "payment")
@Data @NoArgsConstructor @AllArgsConstructor
public class payment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     int paymentId;

    @ManyToOne
    @JoinColumn(name = "invoiceId", nullable = false)
     invoices invoice;

     String paymentType;

}
