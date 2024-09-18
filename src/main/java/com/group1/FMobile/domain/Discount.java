package com.group1.fmobile.domain;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.math.BigDecimal;


@Entity
@Table(name = "DISCOUNT")
@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Discount {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "discount_id", nullable = false)
    Long id;

    @Column(name = "discount_type")
    String discountType;

    @Column(name = "discount_value")
    double  discountValue;

    @Column(name = "min_purchase_amount")
    Long minPurchaseAmount;



}