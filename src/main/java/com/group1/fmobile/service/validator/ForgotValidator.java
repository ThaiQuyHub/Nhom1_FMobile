package com.group1.fmobile.service.validator;

import com.group1.fmobile.domain.dto.ForgotPasswordDTO;
import com.group1.fmobile.service.UserService;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import org.springframework.stereotype.Service;

@Service
public class ForgotValidator implements ConstraintValidator<ForgotChecked, ForgotPasswordDTO> {
    private final UserService userService;

    public ForgotValidator(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean isValid(ForgotPasswordDTO user, ConstraintValidatorContext context) {
        boolean valid = true;
        if (!this.userService.checkEmailExist(user.getEmail())){
            context.buildConstraintViolationWithTemplate("Email khong ton tai!")
                    .addPropertyNode("email")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;

        }
        return valid;
    }
}
