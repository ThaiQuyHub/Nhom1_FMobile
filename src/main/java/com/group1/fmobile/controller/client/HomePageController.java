package com.group1.fmobile.controller.client;

import com.group1.fmobile.domain.dto.*;
import com.group1.fmobile.service.account.AccountService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller("clientctl")
//@RequestMapping("/user")
//@PreAuthorize("hasRole('USER')")
public class HomePageController {
    private final AccountService accountService;

    @Autowired
    public HomePageController(AccountService accountService) {
        this.accountService = accountService;
    }

    @GetMapping("/register")
    public String registerPage(Model model) {
        model.addAttribute("register", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String registerPage(@ModelAttribute("register") @Valid RegisterDTO registerDTO,
                               BindingResult bindingResult,
                               HttpSession session,
                               Model model) {
        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }


        try {
            accountService.registerUser(registerDTO);
            session.setAttribute("registeredEmail", registerDTO.getEmail());
            return "redirect:/verify";
        } catch (RuntimeException e) {
            model.addAttribute("error", e.getMessage());
            return "client/auth/register";
        }
    }


    @GetMapping("/login")
    public String loginPage(Model model, HttpSession session) {
        model.addAttribute("login", new LoginDTO());
        session.removeAttribute("loggedInUser");
        return "client/auth/login";
    }

    @PostMapping("/login")
    public String loginPage(@ModelAttribute("login") @Valid LoginDTO loginDTO, BindingResult bindingResult, HttpSession session, Model model) {
        if (bindingResult.hasErrors()) {
            return "client/auth/login";
        }

        try {
            accountService.authenticateUser(loginDTO.getEmail(), loginDTO.getPassword());
            session.setAttribute("loggedInUser", loginDTO.getEmail());
            return "redirect:/home";
        } catch (RuntimeException e){
            model.addAttribute("error", e.getMessage());
            return "client/auth/login";
        }
    }

//    @GetMapping("/home")
//    public String homePage(HttpSession session, Model model) {
//        String loggedInUser = (String) session.getAttribute("loggedInUser");
//        if (loggedInUser == null) {
//            return "redirect:/login";
//        }
//        model.addAttribute("userName", loggedInUser);
//        return "client/homepage/index";
//    }

    @GetMapping("/forgotpassword")
    public String forgotPasswordPage(Model model) {
        model.addAttribute("forgotpassword", new ForgotPasswordDTO());
        return "client/auth/forgotpassword";
    }


    @PostMapping("/forgotpassword")
    public String forgotPasswordPage(@ModelAttribute("forgotpassword") @Valid ForgotPasswordDTO forgotPasswordDTO,
                                     BindingResult bindingResult,
                                     HttpSession httpSession,
                                     Model model) {
        if (bindingResult.hasErrors()) {
            return "client/auth/forgotpassword";
        }

        try {
            accountService.initiatePasswordReset(forgotPasswordDTO.getEmail());
            httpSession.setAttribute("resetEmail", forgotPasswordDTO.getEmail());
            return "redirect:/reset-password";
        } catch (Exception e) {
            model.addAttribute("error", "An error occurred while processing your request. Please try again.");
            return "client/auth/forgotpassword";
        }
    }

    @GetMapping("/verify")
    public String verifyPage(Model model) {
        model.addAttribute("verify", new VerifyDTO());
        return "client/auth/verify";
    }

    @PostMapping("/verify")
    public String verifyPage(@Valid @ModelAttribute("verify") VerifyDTO verifyDTO,
                             BindingResult bindingResult,
                             HttpSession httpSession) {
        if (bindingResult.hasErrors()) {
            return "client/auth/verify";
        }

        String email = (String) httpSession.getAttribute("registeredEmail");
        if (email != null && accountService.verifyAccount(email, verifyDTO.getOtp())) {
            httpSession.removeAttribute("registeredEmail");
            return "redirect:/login";
        }
        return "redirect:/verify?error";
    }

    @PostMapping("/resend-otp")
    @ResponseBody
    public String resendOTP(HttpSession httpSession) {
        String email = (String) httpSession.getAttribute("registeredEmail");
        if (email != null) {
            accountService.resendOTP(email);
            return "OTP has been resent. Please check your email.";
        }
        return "Registered email address not found.";
    }

    @GetMapping("/reset-password")
    public String resetPassword(Model model) {
        model.addAttribute("resetpassword",new ResetPasswordDTO());
        return "client/auth/resetpassword";
    }

    @PostMapping("/reset-password")
    public String resetPassword(@ModelAttribute("resetpassword") @Valid ResetPasswordDTO resetPasswordDTO,
                                BindingResult bindingResult,
                                HttpSession httpSession,
                                Model model) {
        if (bindingResult.hasErrors()) {
            return "client/auth/resetpassword";
        }

        String email = (String) httpSession.getAttribute("resetEmail");

//        if (email == null) {
//            model.addAttribute("error", "Không tìm thấy email để khôi phục mật khẩu.");
//            return "client/auth/resetpassword";
//        }

        try {
            if (accountService.resetPassword(email, resetPasswordDTO.getOtp(), resetPasswordDTO.getNewPassword())) {
                httpSession.removeAttribute("resetEmail");
                return "redirect:/login?resetSuccess";
            } else {
                model.addAttribute("error", "Mã OTP không chính xác hoặc đã hết hạn.");
                return "client/auth/resetpassword";
            }
        } catch (Exception e) {
            model.addAttribute("error", "Có lỗi xảy ra. Vui lòng thử lại.");
            return "client/auth/resetpassword";
        }
    }
}
