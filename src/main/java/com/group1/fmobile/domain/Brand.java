package com.group1.fmobile.domain;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

import java.util.LinkedHashSet;
import java.util.Set;


@Entity
@Table(name = "BRAND")
@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Brand {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "brand_id", nullable = false)
    Long id;

    @Column(name = "brand_name", nullable = false)
    String brandName;

    @Lob
    @Column(name = "description")
    String description;

    // LK Product
    @OneToMany(mappedBy = "brand")
    Set<Product> products = new LinkedHashSet<>();

}