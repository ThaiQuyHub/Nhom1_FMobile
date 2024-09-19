package com.group1.FMobile.service.validator;

import com.group1.FMobile.domain.dto.VerifyDTO;
import com.group1.FMobile.service.account.OtpService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Service
public class VerifyValidator implements ConstraintValidator<VerifyChecked, VerifyDTO> {
private final OtpService otpService;

    public VerifyValidator(OtpService otpService) {
        this.otpService = otpService;
    }



    @Override
    public boolean isValid(VerifyDTO verifyDTO, ConstraintValidatorContext context) {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession(true);
        String email = (String) session.getAttribute("registeredEmail");

        if (!otpService.verifyOtp(email, verifyDTO.getOtp())) {
            context.buildConstraintViolationWithTemplate("Mã OTP không chính xác hoặc đã hết hạn.")
                    .addPropertyNode("otp")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            return false;
        }

        return otpService.verifyOtp(email, verifyDTO.getOtp());
    }
}
