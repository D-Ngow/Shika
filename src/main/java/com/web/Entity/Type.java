package com.web.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;

@Entity
@Table(name = "type")
@Data @AllArgsConstructor @NoArgsConstructor
public class Type {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     int typeId;
    
     String size;

    @OneToMany(mappedBy = "type")
     List<Details> Details;

}
