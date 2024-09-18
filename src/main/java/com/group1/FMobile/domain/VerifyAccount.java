package com.group1.FMobile;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;

@Getter
@Setter
@Entity
@Table(name = "VERIFY_ACCOUNT")
public class VerifyAccount {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "verify_id", nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @Column(name = "token")
    private String token;

    @Column(name = "expired_date")
    private Instant expiredDate;

    @Column(name = "created_date")
    private Instant createdDate;

}