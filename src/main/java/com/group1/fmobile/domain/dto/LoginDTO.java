package com.group1.fmobile.domain.dto;

import jakarta.validation.constraints.Email;

import jakarta.validation.constraints.NotNull;
import lombok.AccessLevel;

import lombok.Data;

import lombok.experimental.FieldDefaults;



@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class LoginDTO  {

    @Email(message = "Email không hợp lệ", regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")
    String email;
    @NotNull
    String password;
}
