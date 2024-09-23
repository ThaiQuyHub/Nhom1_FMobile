package com.group1.FMobile;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "PAYMENT_METHOD")
public class PaymentMethod {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "payment_method_id", nullable = false)
    private Long id;

    @Column(name = "payment_name", nullable = false)
    private String paymentName;

    @OneToMany(mappedBy = "paymentMethod")
    private Set<Order> orders = new LinkedHashSet<>();

    @OneToMany(mappedBy = "paymentMethod")
    private Set<TransactionHistory> transactionHistories = new LinkedHashSet<>();

}