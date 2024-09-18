package com.group1.fmobile.controller.admin;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasRole('ADMIN')")
public class DashboardController {
    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/admin")
    public String gethome(){
        return "admin/dashboard/show";

    }
}
