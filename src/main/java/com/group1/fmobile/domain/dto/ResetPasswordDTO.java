package com.group1.fmobile.domain.dto;

import com.group1.fmobile.service.validator.ResetPasswordChecked;
import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
@ResetPasswordChecked
public class ResetPasswordDTO {

    String otp;
    String newPassword;
    String confirmNewPassword;


}
