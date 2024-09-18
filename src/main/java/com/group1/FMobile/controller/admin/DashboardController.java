package com.group1.fmobile.controller.admin;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasRole('ADMIN')")
=======

@Controller

>>>>>>> d358adf7717c9801ffd85c751589b68374d3a4a0
public class DashboardController {
    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/admin")
    public String gethome(){
        return "admin/dashboard/show";

    }
}
