package com.group1.FMobile;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "\"USER\"")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id", nullable = false)
    private Long id;

    @Column(name = "password")
    private String password;

    @Column(name = "email")
    private String email;

    @Column(name = "full_name", nullable = false, length = 100)
    private String fullName;

    @Column(name = "phone", length = 20)
    private String phone;

    @Column(name = "address")
    private String address;

    @Column(name = "created_at")
    private Instant createdAt;

    @Column(name = "updated_at")
    private Instant updatedAt;

    @Column(name = "total_purchase_amount")
    private Long totalPurchaseAmount;

    @Column(name = "isActive")
    private Boolean isActive;

    @OneToMany(mappedBy = "user")
    private Set<Order> orders = new LinkedHashSet<>();

    @OneToMany(mappedBy = "user")
    private Set<TransactionHistory> transactionHistories = new LinkedHashSet<>();

    @ManyToMany(mappedBy = "user")
    private Set<Role> roles = new LinkedHashSet<>();

    @OneToMany(mappedBy = "user")
    private Set<VerifyAccount> verifyAccounts = new LinkedHashSet<>();

}