package com.group1.FMobile;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "BRAND")
public class Brand {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "brand_id", nullable = false)
    private Long id;

    @Column(name = "brand_name", nullable = false)
    private String brandName;

    @Lob
    @Column(name = "description")
    private String description;

    @OneToMany(mappedBy = "brand")
    private Set<Product> products = new LinkedHashSet<>();

}