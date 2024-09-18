package com.group1.fmobile.domain.dto;

import com.group1.fmobile.domain.PaymentMethod;
import com.group1.fmobile.domain.User;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class OrderDTO {
    private LocalDateTime orderDate;
    private String status;
    private PaymentMethod paymentMethod;
    private String shippingAddress;
    private Double totalPayment;
    private String fullName;
    private String phone;
    private String email;
    private User user;
}
