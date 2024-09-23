package com.group1.FMobile;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "DISCOUNT")
public class Discount {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "discount_id", nullable = false)
    private Long id;

    @Column(name = "discount_type")
    private String discountType;

    @Column(name = "discount_value", precision = 4, scale = 3)
    private BigDecimal discountValue;

    @Column(name = "min_purchase_amount")
    private Long minPurchaseAmount;

    @OneToMany(mappedBy = "discount")
    private Set<Order> orders = new LinkedHashSet<>();

}