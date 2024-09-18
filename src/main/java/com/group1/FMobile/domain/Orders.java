package com.group1.fmobile.domain;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.Instant;
import java.time.LocalDateTime;
import java.util.LinkedHashSet;
import java.util.Set;


@Entity
@Table(name = "ORDERS")
@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Orders {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id", nullable = false)
    Long id;

    //LK User
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    User user;

    //LK Discount
<<<<<<< HEAD
    @ManyToOne
    @JoinColumn(name = "discount_id")
    Discount discount;

    @Column(name = "total_payment", nullable = false)
    Double totalPayment;
=======
    @OneToOne
    @JoinColumn(name = "discount_id", referencedColumnName = "discount_id")
    Discount discount;

    @Column(name = "total_payment", nullable = false)
    Long totalPayment;
>>>>>>> d358adf7717c9801ffd85c751589b68374d3a4a0

    @Column(name = "status", length = 50)
    String status;

    @Column(name = "order_date")
    LocalDateTime orderDate;

    @Column(name = "shipping_address")
    String shippingAddress;

<<<<<<< HEAD
    String phone;

    String fullName;

=======
>>>>>>> d358adf7717c9801ffd85c751589b68374d3a4a0
    //LK Orders Detail
    @OneToMany(mappedBy = "orders")
    Set<OrdersDetail> ordersDetails = new LinkedHashSet<>();

    // LK Transaction History
    @OneToOne(mappedBy = "orders")
    TransactionHistory transactionHistory;

<<<<<<< HEAD
    @ManyToOne
    @JoinColumn(name = "payment_method_id")
    private PaymentMethod paymentMethod;
=======
>>>>>>> d358adf7717c9801ffd85c751589b68374d3a4a0
}