package com.group1.fmobile.domain.dto;

<<<<<<< HEAD
import com.group1.fmobile.service.validator.LoginChecked;
=======
>>>>>>> d358adf7717c9801ffd85c751589b68374d3a4a0
import jakarta.validation.constraints.Email;

import jakarta.validation.constraints.NotNull;
import lombok.AccessLevel;

import lombok.Data;

import lombok.experimental.FieldDefaults;



@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
<<<<<<< HEAD
@LoginChecked
=======
>>>>>>> d358adf7717c9801ffd85c751589b68374d3a4a0
public class LoginDTO  {

    @Email(message = "Email không hợp lệ", regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")
    String email;
<<<<<<< HEAD
    @NotNull(message = "Mật khẩu không được để trống")
=======
    @NotNull
>>>>>>> d358adf7717c9801ffd85c751589b68374d3a4a0
    String password;
}
