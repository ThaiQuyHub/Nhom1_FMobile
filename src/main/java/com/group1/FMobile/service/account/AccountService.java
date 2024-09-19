package com.group1.FMobile.service.account;

import com.group1.FMobile.domain.Role;
import com.group1.FMobile.domain.RoleType;
import com.group1.FMobile.domain.User;
import com.group1.FMobile.domain.dto.RegisterDTO;
import com.group1.FMobile.service.RoleService;
import com.group1.FMobile.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.TimeUnit;

@Service
public class AccountService {
    private static final Logger logger = LoggerFactory.getLogger(AccountService.class);
    private final UserService userService;
    private final RoleService roleService;
    private final PasswordEncoder passwordEncoder;
    private final MailService mailService;
    private final OtpService otpService;

    @Autowired
    public AccountService(UserService userService, RoleService roleService, PasswordEncoder passwordEncoder, MailService mailService, OtpService otpService) {
        this.userService = userService;
        this.roleService = roleService;
        this.passwordEncoder = passwordEncoder;
        this.mailService = mailService;
        this.otpService = otpService;
    }

    @Transactional
    public void registerUser(RegisterDTO registerDTO) {
        try {
            User user = new User();
            user.setEmail(registerDTO.getEmail());
            user.setFullName(registerDTO.getFullName());
            user.setPhone(registerDTO.getPhone());
            user.setAddress(registerDTO.getAddress());
            user.setPassword(registerDTO.getPassword());
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            user.setEnabled(false);
            user.setCreationDate(LocalDate.now());
            user.setUpdatedAt(LocalDateTime.now());

            Role userRole = roleService.findByName(RoleType.USER)
                    .orElseGet(() -> {
                        Role newRole = new Role();
                        newRole.setName(RoleType.USER);
                        return roleService.save(newRole);
                    });

            Set<Role> roles = new HashSet<>();
            roles.add(userRole);
            user.setRoles(roles);

            userService.saveUser(user);

            String otp = otpService.generateOTP();
            otpService.saveOtp(user.getEmail(), otp, TimeUnit.MINUTES.toMillis(1));
            mailService.sendVerificationEmail(user.getEmail(), otp);

        } catch (Exception e) {
            logger.error("Lỗi khi đăng ký người dùng", e);
            throw new RuntimeException("Không thể đăng ký người dùng", e);
        }
    }

    @Transactional
    public boolean verifyAccount(String email, String otp) {
        try {
            if (otpService.verifyOtp(email, otp)) {
                User user = userService.findByEmail(email);
                user.setEnabled(true);
                userService.saveUser(user);
                otpService.removeOtp(email);
                return true;
            }
        } catch (Exception e) {
            logger.error("Lỗi khi xác thực tài khoản: ", e);
        }
        return false;
    }

    public void resendOTP(String email) {
        try {
            User user = userService.findByEmail(email);
            if (!user.isEnabled()) {
                String otp = otpService.generateOTP();
                otpService.saveOtp(email, otp, TimeUnit.MINUTES.toMillis(1));
                mailService.sendVerificationEmail(email, otp);
            } else {
                throw new RuntimeException("Tài khoản đã được xác thực");
            }
        } catch (Exception e) {
            logger.error("Lỗi khi gửi lại OTP xác thực: ", e);
            throw new RuntimeException("Không thể gửi lại OTP xác thực", e);
        }
    }

    public void initiatePasswordReset(String email) {
        try {
            User user = userService.findByEmail(email);
            if (user != null) {
                String otp = otpService.generateOTP();
                otpService.saveOtp(email, otp, TimeUnit.MINUTES.toMillis(1));
                mailService.sendPasswordResetEmail(email, otp);
            }
        } catch (Exception e) {
            logger.error("Lỗi khi khởi tạo đặt lại mật khẩu: ", e);
            throw new RuntimeException("Không thể khởi tạo đặt lại mật khẩu", e);
        }
    }

    //Phương thức đặt lại mật khẩu
    public boolean resetPassword(String email, String otp, String newPassword) {
        try {
            if (otpService.verifyOtp(email, otp)) {
                User user = userService.findByEmail(email);
                if (user != null) {
                    user.setPassword(passwordEncoder.encode(newPassword));
                    userService.saveUser(user);
                    otpService.removeOtp(email);
                    return true;
                }
            }
        } catch (Exception e) {
            logger.error("Lỗi khi đặt lại mật khẩu: ", e);
        }
        return false;
    }
    public boolean authenticateUser(String username, String password) {
        User user = userService.findByEmail(username);
        if (user != null && user.isEnabled()) {
            return passwordEncoder.matches(password, user.getPassword());
        }
        return false;
    }
}