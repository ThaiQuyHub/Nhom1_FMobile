package com.group1.fmobile.domain.dto;

import com.group1.fmobile.service.validator.RegisterChecked;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
@RegisterChecked
public class RegisterDTO {

    @NotBlank(message = "Email is required")
    @Email(message = "Invalid email", regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")
    String email;

    @NotBlank(message = "Full name is required")
    @Size(min = 3, message = "Full name must contain at least 3 characters")
    String fullName;

    @NotBlank(message = "Phone number is required")
    @Pattern(regexp = "^(0[0-9]{9})$", message = "Invalid phone number")
    String phone;

    @NotBlank(message = "Address is required")
    String address;

    @NotBlank(message = "Password is required")
    @Size(min = 6, message = "Password must contain at least 6 characters")
    String password;

    @NotBlank(message = "Password confirmation is required")
    String confirmPassword;


    public boolean isPasswordMatching() {
        return this.password.equals(this.confirmPassword);
    }
}
