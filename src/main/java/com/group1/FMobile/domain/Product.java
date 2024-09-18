package com.group1.fmobile.domain;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.math.BigDecimal;
import java.time.LocalDateTime;
<<<<<<< HEAD
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
=======
import java.util.LinkedHashSet;
>>>>>>> d358adf7717c9801ffd85c751589b68374d3a4a0
import java.util.Set;

@Entity
@Table(name = "PRODUCT")
@Data
@AllArgsConstructor
@NoArgsConstructor
<<<<<<< HEAD
@Getter
@Setter
=======
>>>>>>> d358adf7717c9801ffd85c751589b68374d3a4a0
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id", nullable = false)
    Long id;

    // LK Brand
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "brand_id")
    Brand brand;

    // LK Product Category
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_category_id")
    ProductCategory productCategory;

    @Column(name = "product_name", nullable = false)
    String productName;

    @Column(name = "price", nullable = false)
    double price;

    @Column(name = "quantity", nullable = false)
    int quantity;

    @Column(name = "sold")
    int sold;

    @Column(name = "color")
    String color;

    @Column(name = "ram")
    String ram;

    @Lob
    @Column(name = "description")
    String description;

<<<<<<< HEAD
    @Column(name = "created_at")
    LocalDateTime createdAt;

    @Column(name = "updated_at")
    LocalDateTime updatedAt;

    // LK Image
    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    List<Image> images = new ArrayList<>();

    // LK Orders Detail
    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    List<OrdersDetail> ordersDetails = new ArrayList<>();
=======
    @Column(name = "created_product")
    LocalDateTime createdProduct;

    @Column(name = "updated_product")
    LocalDateTime updatedProduct;

    @Column(name = "image_url")
    String imageUrl;

    // LK Image
    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    Set<Image> assets = new LinkedHashSet<>();

    // LK Orders Detail
    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    Set<OrdersDetail> ordersDetails = new LinkedHashSet<>();
>>>>>>> d358adf7717c9801ffd85c751589b68374d3a4a0
}
