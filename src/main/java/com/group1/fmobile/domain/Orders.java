package com.group1.fmobile.domain;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.LinkedHashSet;
import java.util.Set;


@Entity
@Table(name = "ORDERS")
@Data
@AllArgsConstructor
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
    @OneToOne
    @JoinColumn(name = "discount_id", referencedColumnName = "discount_id")
    Discount discount;

    @Column(name = "total_payment", nullable = false)
    Long totalPayment;

    @Column(name = "status", length = 50)
    String status;

    @Column(name = "order_date")
    LocalDate orderDate;

    @Column(name = "shipping_address")
    String shippingAddress;

    //LK Orders Detail
    @OneToMany(mappedBy = "orders")
    Set<OrdersDetail> ordersDetails = new LinkedHashSet<>();

    // LK Transaction History
    @OneToOne(mappedBy = "orders")
    TransactionHistory transactionHistory;

    public Orders() {
    }

    public Orders(Long id, User user, Discount discount, Long totalPayment, String status, LocalDate orderDate,
                  String shippingAddress, TransactionHistory transactionHistory) {
        this.id = id;
        this.user = user;
        this.discount = discount;
        this.totalPayment = totalPayment;
        this.status = status;
        this.orderDate = orderDate;
        this.shippingAddress = shippingAddress;
        this.transactionHistory = transactionHistory;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Discount getDiscount() {
        return discount;
    }

    public void setDiscount(Discount discount) {
        this.discount = discount;
    }

    public Long getTotalPayment() {
        return totalPayment;
    }

    public void setTotalPayment(Long totalPayment) {
        this.totalPayment = totalPayment;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDate getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDate orderDate) {
        this.orderDate = orderDate;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public Set<OrdersDetail> getOrdersDetails() {
        return ordersDetails;
    }

    public void setOrdersDetails(Set<OrdersDetail> ordersDetails) {
        this.ordersDetails = ordersDetails;
    }

    public TransactionHistory getTransactionHistory() {
        return transactionHistory;
    }

    public void setTransactionHistory(TransactionHistory transactionHistory) {
        this.transactionHistory = transactionHistory;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "id=" + id +
                ", user=" + user +
                ", discount=" + discount +
                ", totalPayment=" + totalPayment +
                ", status='" + status + '\'' +
                ", orderDate=" + orderDate +
                ", shippingAddress='" + shippingAddress + '\'' +
                ", ordersDetails=" + ordersDetails +
                ", transactionHistory=" + transactionHistory +
                '}';
    }
}