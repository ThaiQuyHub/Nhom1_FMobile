package com.group1.FMobile;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "PRODUCT")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id", nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "brand_id")
    private Brand brand;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_category_id")
    private ProductCategory productCategory;

    @Column(name = "product_name", nullable = false)
    private String productName;

    @Column(name = "price", nullable = false, precision = 10, scale = 2)
    private BigDecimal price;

    @Column(name = "quantity", nullable = false)
    private Integer quantity;

    @Column(name = "sold")
    private Integer sold;

    @Column(name = "color")
    private String color;

    @Column(name = "ram")
    private String ram;

    @Lob
    @Column(name = "description")
    private String description;

    @Column(name = "created_product")
    private Instant createdProduct;

    @Column(name = "update_product")
    private Instant updateProduct;

    @Column(name = "image_url")
    private String imageUrl;

    @OneToMany(mappedBy = "product")
    private Set<Asset> assets = new LinkedHashSet<>();

    @OneToMany(mappedBy = "product")
    private Set<OrdersDetail> ordersDetails = new LinkedHashSet<>();

}