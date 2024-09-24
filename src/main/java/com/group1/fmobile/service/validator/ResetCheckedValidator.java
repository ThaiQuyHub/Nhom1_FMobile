package com.group1.fmobile.service.validator;

import com.group1.fmobile.domain.dto.ResetPasswordDTO;
import com.group1.fmobile.service.account.OtpService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Service
public class ResetCheckedValidator implements ConstraintValidator<ResetPasswordChecked, ResetPasswordDTO> {
    private final OtpService otpService;

    public ResetCheckedValidator(OtpService otpService) {
        this.otpService = otpService;
    }

    @Override
    public boolean isValid(ResetPasswordDTO user, ConstraintValidatorContext context) {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession(false);

        if (session == null) {
            context.buildConstraintViolationWithTemplate("Phiên làm việc không hợp lệ.")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            return false;
        }

        String email = (String) session.getAttribute("resetEmail");

        if (email == null) {
            context.buildConstraintViolationWithTemplate("Email không tồn tại trong phiên làm việc.")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            return false;
        }

        if (!otpService.verifyOtp(email, user.getOtp())) {
            context.buildConstraintViolationWithTemplate("Mã OTP không chính xác hoặc đã hết hạn.")
                    .addPropertyNode("otp")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            return false;
        }

        if (!user.getNewPassword().equals(user.getConfirmNewPassword())) {
            context.buildConstraintViolationWithTemplate("Mật khẩu không trùng khớp.")
                    .addPropertyNode("confirmNewPassword")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            return false;
        }

        return true;
    }

}
