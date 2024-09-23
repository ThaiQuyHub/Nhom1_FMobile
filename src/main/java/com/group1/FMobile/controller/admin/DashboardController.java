package com.group1.fmobile.controller.admin;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller

public class DashboardController {
    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/home")
    public String gethome(){
        return "admin/dashboard/show";

    }
}
