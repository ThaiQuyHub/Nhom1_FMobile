package com.group1.fmobile.service.account;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {
    private static final Logger logger = LoggerFactory.getLogger(MailService.class);


    private final JavaMailSender mailSender;

    @Autowired
    public MailService(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    public void sendVerificationEmail(String to, String otp) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(to);
            message.setSubject("Xác thực tài khoản");
            message.setText("Mã OTP để xác thực tài khoản của bạn là: " + otp);
            mailSender.send(message);
        } catch (Exception e) {
            logger.error("Lỗi khi gửi email xác thực: ", e);
            throw new RuntimeException("Không thể gửi email xác thực", e);
        }
    }

    public void sendPasswordResetEmail(String to, String otp) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(to);
            message.setSubject("Đặt lại mật khẩu");
            message.setText("Mã OTP để đặt lại mật khẩu của bạn là: " + otp);
            mailSender.send(message);
        } catch (Exception e) {
            logger.error("Lỗi khi gửi email đặt lại mật khẩu: ", e);
            throw new RuntimeException("Không thể gửi email đặt lại mật khẩu", e);
        }
    }
}
