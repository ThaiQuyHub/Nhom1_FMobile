package com.group1.fmobile.controller.client;

import com.group1.fmobile.domain.User;
import com.group1.fmobile.service.client.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/userpage")
public class UserController {
    private final UserService userService;
    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

//    @GetMapping("/info")
//    @ResponseBody
//    public ResponseEntity<Map<String, String>> getUserInfo(Principal principal) {
//        if (principal != null) {
//            User user = userService.findByEmail(principal.getName());
//            Map<String, String> response = new HashMap<>();
//            response.put("fullName", user.getFullName());
//            return ResponseEntity.ok(response);
//        }
//        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
//    }
@GetMapping("/info")
public String getUserInfo(Principal principal, Model model) {
    if (principal == null) {
        model.addAttribute("error", "Người dùng chưa được xác thực");
        return "error-page";
    }

    try {
        User user = userService.findByEmail(principal.getName());
        model.addAttribute("user", user); // Truyền đối tượng người dùng vào model
        return "user-info"; // Trả về tên trang JSP hiển thị thông tin
    } catch (Exception e) {
        model.addAttribute("error", "Lỗi khi truy xuất thông tin người dùng: " + e.getMessage());
        return "error-page";
    }
}

}
