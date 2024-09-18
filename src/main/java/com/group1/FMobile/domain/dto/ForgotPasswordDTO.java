package com.group1.fmobile.domain.dto;

<<<<<<< HEAD
import com.group1.fmobile.service.validator.ForgotChecked;
import jakarta.validation.constraints.Email;
=======
>>>>>>> d358adf7717c9801ffd85c751589b68374d3a4a0
import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
<<<<<<< HEAD
@ForgotChecked
public class ForgotPasswordDTO {

=======
public class ForgotPasswordDTO {
>>>>>>> d358adf7717c9801ffd85c751589b68374d3a4a0
    private String email;

}
