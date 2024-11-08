package com.web.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "type")
@Data @AllArgsConstructor @NoArgsConstructor
public class Type {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     int typeId;
    
     int size;

    @OneToMany(mappedBy = "type")
    @JsonManagedReference(value = "type-details")
     List<Details> Details;

}
