package com.group1.fmobile.domain.dto;

import com.group1.fmobile.service.validator.ForgotChecked;
import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
@ForgotChecked
public class ForgotPasswordDTO {

    private String email;

}
