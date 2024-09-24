package com.group1.fmobile.domain.dto;

import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

@Data
public class OrderDTO {
    private Long id;
    private LocalDateTime orderDate;
    private Long totalPayment;
    private String status;
    private List<OrderDetailDTO> orderDetails;
}
