package com.group1.FMobile.domain;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.Instant;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "ORDERS")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id", nullable = false)
    private Long id;

    //LK User
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    //LK Discount
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "discount_id")
    private Discount discount;

    @Column(name = "total_payment", nullable = false)
    private Long totalPayment;

    @Column(name = "status", length = 50)
    private String status;

    @Column(name = "order_date")
    private Instant orderDate;

    @Column(name = "shipping_address")
    private String shippingAddress;

    //LK
    @OneToMany(mappedBy = "order")
    private Set<OrdersDetail> ordersDetails = new LinkedHashSet<>();

    @OneToMany(mappedBy = "order")
    private Set<TransactionHistory> transactionHistories = new LinkedHashSet<>();

}