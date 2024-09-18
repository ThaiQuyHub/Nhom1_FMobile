package com.group1.fmobile.domain;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;

import java.time.LocalDateTime;
import java.time.LocalTime;
<<<<<<< HEAD
=======
import java.util.LinkedHashSet;
>>>>>>> d358adf7717c9801ffd85c751589b68374d3a4a0
import java.util.Set;

@Entity
@Table(name = "users")
@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long id;
    String password;
    String email;
    String fullName;
    String phone;
    String address;
    LocalDate creationDate ;;
    LocalDateTime updatedAt;
    long amount;
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "user_roles",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id")
    )
    Set<Role> roles;
    boolean enabled = false;
<<<<<<< HEAD
=======
    @OneToMany(mappedBy = "user")
    Set<Orders> orders = new LinkedHashSet<>();



>>>>>>> d358adf7717c9801ffd85c751589b68374d3a4a0


}
